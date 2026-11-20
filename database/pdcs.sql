-- Skema basis data akademik untuk tugas Pertemuan 2.
-- Tiga tabel: jurusan, mahasiswa, matakuliah. Relasi jurusan ke mahasiswa
-- dan jurusan ke matakuliah masing-masing one to many melalui Foreign Key.

CREATE DATABASE IF NOT EXISTS pdcs
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE pdcs;

CREATE TABLE IF NOT EXISTS jurusan (
    id INT(11) NOT NULL AUTO_INCREMENT,
    kode_jurusan VARCHAR(32) NOT NULL,
    nama_jurusan VARCHAR(64) NOT NULL,
    fakultas VARCHAR(32) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY kode_jurusan (kode_jurusan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS mahasiswa (
    id INT(11) NOT NULL AUTO_INCREMENT,
    jurusan_id INT(11) DEFAULT NULL,
    nama VARCHAR(32) NOT NULL,
    nim VARCHAR(32) NOT NULL,
    created_at DATE DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY nim (nim),
    KEY jurusan_id (jurusan_id),
    CONSTRAINT fk_mahasiswa_jurusan FOREIGN KEY (jurusan_id)
        REFERENCES jurusan (id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS matakuliah (
    id INT(11) NOT NULL AUTO_INCREMENT,
    jurusan_id INT(11) DEFAULT NULL,
    kode_mk VARCHAR(32) NOT NULL,
    nama_mk VARCHAR(64) NOT NULL,
    sks INT(8) NOT NULL,
    semester INT(8) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY kode_mk (kode_mk),
    KEY jurusan_id (jurusan_id),
    CONSTRAINT fk_matakuliah_jurusan FOREIGN KEY (jurusan_id)
        REFERENCES jurusan (id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO jurusan (id, kode_jurusan, nama_jurusan, fakultas) VALUES
(1, 'TI', 'Teknik Informatika', 'Teknologi Informasi'),
(2, 'SI', 'Sistem Informasi', 'Teknologi Informasi');

INSERT INTO mahasiswa (id, jurusan_id, nama, nim, created_at) VALUES
(1, 1, 'Budi Santoso', '2211500001', '2026-11-20'),
(2, 2, 'Siti Rahma', '2211500002', '2026-11-20'),
(3, 1, 'Fajar', '2211500007', '2026-11-20');

INSERT INTO matakuliah (id, jurusan_id, kode_mk, nama_mk, sks, semester) VALUES
(1, 1, 'IT027', 'Pemrograman Database Client Server', 3, 5),
(2, 1, 'IT014', 'Basis Data', 3, 3),
(3, 2, 'SI021', 'Analisis dan Perancangan Sistem', 3, 4);
