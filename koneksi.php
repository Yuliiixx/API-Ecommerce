<?php

$koneksi = mysqli_connect("localhost", "root", "", "db_ecommerce");

if($koneksi){

	// echo "Database berhasil konek";
	
} else {
	echo "gagal Connect";
}

?>