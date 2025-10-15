# Blueprint Aplikasi Study Buddy

## Ringkasan

Study Buddy adalah aplikasi seluler yang dirancang untuk membantu siswa mengatur jadwal belajar, membuat catatan, dan tetap fokus dengan fitur-fitur canggih seperti kuis yang dibuat oleh AI. Aplikasi ini mengadopsi antarmuka pengguna yang bersih dan modern dengan dukungan penuh untuk mode terang dan gelap.

## Gaya, Desain, dan Fitur

### Sistem Desain Universal

*   **Skema Warna & Tipografi:** Konsisten di seluruh aplikasi menggunakan tema yang terpusat di `main.dart`, dengan `GoogleFonts.lato` sebagai font utama.
*   **Gaya Komponen:** Menggunakan gaya modern untuk Kartu, Tombol, dan bidang Input untuk pengalaman pengguna yang kohesif.

### Fitur Utama & Layar

*   **Layar Login & Beranda:** Pengalaman orientasi pengguna yang menarik secara visual dan fungsional.
*   **Layar Jadwal:** Tampilan sederhana untuk progres dan timeline tugas harian.
*   **Layar Catatan:** Manajemen tugas dengan fitur **penghapusan otomatis** saat tugas selesai (dicentang).
*   **Layar Sesi Fokus (Pomodoro) - UI Baru:**
    *   Tampilan timer melingkar yang menonjol untuk sesi belajar.
    *   Kontrol untuk memulai, menjeda, dan mengatur ulang sesi.
    *   Tombol **"Selesai Sesi"** untuk kembali ke dasbor.
    *   Dapat diakses melalui tombol **"Mode Pomodoro"** di layar Beranda.
*   **Alur Kuis AI:**
    *   **Layar Kuis:** Menampilkan satu pertanyaan dengan beberapa pilihan jawaban. Setelah menjawab, tombol "Lihat Hasil" muncul.
    *   **Layar Hasil Kuis:** Menampilkan skor, pesan motivasi (misalnya, "Luar Biasa!"), dan tombol untuk kembali ke dasbor. Alur ini dimulai dengan menekan tombol **"Latihan dengan AI"** di layar Beranda.
*   **Layar Musik & Profil:** Layar placeholder untuk fungsionalitas di masa mendatang.
*   **Pengalih Tema:** Mendukung mode terang, gelap, dan sistem.

## Rencana Saat Ini

*   **Tugas:** Mengimplementasikan alur kuis satu pertanyaan yang langsung menampilkan hasil.
*   **Langkah-langkah yang Selesai:**
    1.  Membuat `lib/screens/quiz_result_screen.dart` untuk menampilkan skor dan pesan.
    2.  Mengubah tombol "Berikutnya" di `quiz_screen.dart` menjadi "Lihat Hasil".
    3.  Mengimplementasikan navigasi dari layar kuis ke layar hasil, dengan membawa status jawaban (benar/salah).
    4.  Memperbarui `blueprint.md` untuk mendokumentasikan alur baru dan layar hasil.
*   **Langkah Selanjutnya:** Menunggu instruksi berikutnya.
