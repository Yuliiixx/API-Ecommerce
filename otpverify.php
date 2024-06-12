<?php

// Koneksi ke database
include 'koneksi.php';

// Headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Memeriksa metode permintaan
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();

    // Memeriksa apakah email dan otp sudah diatur
    if (isset($_POST['email']) && isset($_POST['otp'])) {
        $email = $_POST['email'];
        $otp = $_POST['otp'];

        // Membersihkan input
        $email = mysqli_real_escape_string($koneksi, $email);
        $otp = mysqli_real_escape_string($koneksi, $otp);

        // Memverifikasi OTP dan waktu kedaluwarsa
        $query = "SELECT * FROM user WHERE email='$email' AND code_verification='$otp'";
        $result = mysqli_query($koneksi, $query);

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            $otp_expiry = $row['otp_expiry'];

            // Memeriksa apakah OTP telah kedaluwarsa
            if (strtotime($otp_expiry) > time()) {
                $response['value'] = 1;
                $response['message'] = 'OTP berhasil diverifikasi';

                // Memperbarui status pengguna menjadi 'verified' jika email dan OTP benar
                $updateQuery = "UPDATE user SET user_status = 'verified' WHERE email='$email'";
                if (mysqli_query($koneksi, $updateQuery)) {
                    $response['message'] = 'kode OTP valid';
                } else {
                    $response['message'] = 'Gagal memperbarui status otp';
                }
            } else {
                $response['value'] = 0;
                $response['message'] = 'OTP telah kedaluwarsa';
            }
        } else {
            $response['value'] = 0;
            $response['message'] = 'OTP tidak valid atau telah kedaluwarsa';
        }
    } else {
        $response['value'] = 0;
        $response['message'] = 'Parameter yang diperlukan tidak ada';
    }

    echo json_encode($response);
} else {
    $response['value'] = 0;
    $response['message'] = 'Metode permintaan tidak valid';
    echo json_encode($response);
}

mysqli_close($koneksi);
?>
