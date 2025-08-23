-- =================================================================
-- SKEMA DATABASE UNTUK WEBSITE PROGRAM STUDI INFORMATIKA
-- =================================================================
-- Anda dapat menjalankan skrip ini di SQL Editor Supabase
-- setelah menghubungkan proyek Anda.

-- Aktifkan ekstensi UUID untuk generate ID unik
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- -----------------------------------------------------
-- Tabel: Dosen (Faculty)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dosen (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nama VARCHAR(255) NOT NULL,
    gelar VARCHAR(100),
    bidang_keahlian TEXT,
    foto_url TEXT,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- -----------------------------------------------------
-- Tabel: Mata Kuliah (Courses)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mata_kuliah (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    kode_mk VARCHAR(20) UNIQUE NOT NULL,
    nama_mk VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    jalur_kurikulum VARCHAR(100) -- e.g., 'Artificial Intelligence', 'Data Science'
);

-- -----------------------------------------------------
-- Tabel: Kategori Pembelajaran (Learning Categories)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS kategori_pembelajaran (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nama_kategori VARCHAR(255) NOT NULL,
    deskripsi TEXT
);

-- -----------------------------------------------------
-- Tabel: Materi Pembelajaran (Learning Topics)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS materi_pembelajaran (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    kategori_id UUID REFERENCES kategori_pembelajaran(id) ON DELETE SET NULL,
    judul VARCHAR(255) NOT NULL,
    deskripsi_tujuan TEXT,
    icon_css_class VARCHAR(100)
);

-- -----------------------------------------------------
-- Tabel: Video Pembelajaran (Learning Videos)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS video_pembelajaran (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    materi_id UUID REFERENCES materi_pembelajaran(id) ON DELETE CASCADE,
    level VARCHAR(50) NOT NULL, -- 'Fundamental', 'Intermediate', 'Advanced'
    judul_video VARCHAR(255) NOT NULL,
    youtube_id VARCHAR(50) NOT NULL,
    urutan INT DEFAULT 0
);

-- -----------------------------------------------------
-- Tabel: Layanan & Jasa (Services)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS layanan (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nama_layanan VARCHAR(255) NOT NULL,
    tipe_layanan VARCHAR(100), -- 'Pengembangan', 'Pelatihan', 'Instalasi'
    deskripsi TEXT,
    rentang_harga VARCHAR(255),
    is_featured BOOLEAN DEFAULT FALSE
);

-- -----------------------------------------------------
-- Tabel: Fitur Layanan (Service Features)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fitur_layanan (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    layanan_id UUID REFERENCES layanan(id) ON DELETE CASCADE,
    fitur TEXT NOT NULL
);

-- -----------------------------------------------------
-- Tabel: Pesan Kontak (Contact Messages)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pesan_kontak (
    id BIGSERIAL PRIMARY KEY,
    nama_lengkap VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telepon VARCHAR(50),
    subjek VARCHAR(255),
    pesan TEXT NOT NULL,
    dikirim_pada TIMESTAMPTZ DEFAULT NOW()
);

-- -----------------------------------------------------
-- Tabel: Mitra Industri (Partners)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mitra_industri (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nama_mitra VARCHAR(255) NOT NULL,
    tipe_mitra VARCHAR(100), -- 'Teknologi Global', 'Industri Nasional'
    logo_url TEXT
);

-- -----------------------------------------------------
-- Tabel: Prestasi Mahasiswa (Student Achievements)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS prestasi_mahasiswa (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    judul_prestasi VARCHAR(255) NOT NULL,
    nama_event VARCHAR(255),
    tahun INT,
    level_kompetisi VARCHAR(100), -- 'Nasional', 'Internasional'
    penghargaan VARCHAR(100) -- 'Juara 1', 'Best Startup'
);

-- -----------------------------------------------------
-- Contoh Data Awal (Bisa dihapus atau disesuaikan)
-- -----------------------------------------------------
INSERT INTO dosen (nama, gelar, bidang_keahlian, email) VALUES
('Dr. Ahmad Rahman', 'M.Kom', 'Artificial Intelligence & Machine Learning', 'ahmad.r@informatika.ac.id'),
('Prof. Siti Nurhaliza', 'Ph.D', 'Data Science & Big Data Analytics', 'siti.n@informatika.ac.id');

INSERT INTO kategori_pembelajaran (nama_kategori, deskripsi) VALUES
('Pengembangan Web & Mobile', 'Kuasai teknologi frontend dan mobile development terkini.'),
('AI dalam FinTech', 'Jelajahi persimpangan antara kecerdasan buatan dan teknologi finansial.'),
('Bahasa Asing', 'Perluas wawasan global Anda dengan menguasai bahasa internasional.');

-- Pesan untuk pengguna:
-- Anda dapat melanjutkan dengan menambahkan data lain sesuai kebutuhan.
-- Skema ini dirancang untuk menjadi dasar yang solid untuk aplikasi Anda.
