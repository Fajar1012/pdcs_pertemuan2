# PDCS Pertemuan 2

Tugas Pertemuan 2 mata kuliah Pemrograman Database Client Server (IT027).
Materi: ERD sistem akademik, koneksi PHP-MySQL yang aman, helper respons JSON,
dan endpoint GET mahasiswa dengan LEFT JOIN ke tabel jurusan.

## Struktur Project

| Berkas | Keterangan |
| --- | --- |
| `config.php` | Pusat pengaturan koneksi MySQL, memanggil helper saat koneksi gagal (HTTP 500) |
| `helpers/response.php` | Fungsi `sendResponse` untuk format JSON seragam (status, message, data) |
| `api/mahasiswa.php` | Endpoint GET data mahasiswa dengan LEFT JOIN jurusan |
| `database/pdcs.sql` | Skema database `pdcs`: 3 tabel + Foreign Key beserta data contoh |
| `screenshot/` | Bukti pengujian Thunder Client |

## ERD

Tiga tabel dengan relasi one to many:

- `jurusan` (id PK, kode_jurusan, nama_jurusan, fakultas)
- `mahasiswa` (id PK, jurusan_id FK, nama, nim, created_at)
- `matakuliah` (id PK, jurusan_id FK, kode_mk, nama_mk, sks, semester)

Relasi: `jurusan` ke `mahasiswa` (1:N) dan `jurusan` ke `matakuliah` (1:N).

## Menjalankan

1. Impor `database/pdcs.sql` lewat phpMyAdmin, atau dari terminal:

   ```
   mysql -u root -p < database/pdcs.sql
   ```

2. Sesuaikan `$host`, `$user`, `$pass`, dan `$db` pada `config.php`.

3. Jalankan server. Di Laragon cukup salin folder ini ke `www`, atau pakai
   server bawaan PHP:

   ```
   php -S localhost:8000
   ```

## Pengujian

Endpoint: `GET http://localhost:8000/api/mahasiswa.php`

Contoh respons (200 OK):

```json
{
  "status": true,
  "message": "berhasil",
  "data": [
    {
      "id": "3",
      "nama": "Fajar",
      "nim": "2211500007",
      "jurusan": "Teknik Informatika"
    }
  ]
}
```

Jika koneksi database gagal, API membalas HTTP 500 dengan
`{"status": false, "message": "Koneksi database gagal", "data": null}`
sehingga klien tetap menerima JSON, bukan error HTML mentah.

## Screenshot

- `screenshot/get-mahasiswa.png` — hasil GET `api/mahasiswa.php` berstatus 200 OK
