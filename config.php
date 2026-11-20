<?php

require_once __DIR__ . "/helpers/response.php";

// Matikan laporan error bawaan mysqli supaya error tidak tampil sebagai HTML mentah.
mysqli_report(MYSQLI_REPORT_OFF);

$host = "localhost";
$user = "root";
$pass = "";
$db   = "pdcs";

$koneksi = @mysqli_connect($host, $user, $pass, $db);

if (!$koneksi) {
    sendResponse(
        false,
        "Koneksi database gagal",
        null,
        500
    );
}

mysqli_set_charset($koneksi, "utf8mb4");
