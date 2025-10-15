import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final bool isCorrect; // Menentukan apakah jawaban terakhir benar atau salah
  final int totalQuestions; // Total jumlah pertanyaan dalam kuis

  const QuizResultScreen({
    super.key,
    required this.isCorrect,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ambil tema aplikasi
    final score = isCorrect ? 1 : 0; // Skor sederhana: 1 jika benar, 0 jika salah
    final message = isCorrect ? "Luar Biasa!" : "Coba Lagi, ya!"; // Pesan hasil
    final icon = isCorrect ? Icons.check_circle_outline : Icons.highlight_off; // Ikon hasil
    final iconColor = isCorrect ? Colors.green : Colors.red; // Warna ikon hasil

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'), // Judul halaman hasil kuis
        automaticallyImplyLeading: false, // Hilangkan tombol back default
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ikon besar di bagian atas menunjukkan hasil (benar/salah)
              Icon(icon, color: iconColor, size: 100),
              const SizedBox(height: 24),

              // Pesan hasil kuis (motivasi)
              Text(
                message,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Label "Skor Anda"
              Text(
                'Skor Anda:',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              // Tampilan skor dengan gaya mencolok
              Text(
                '$score / $totalQuestions',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Tombol untuk kembali ke halaman pertama (dasbor)
              ElevatedButton.icon(
                icon: const Icon(Icons.home_outlined),
                label: const Text('Kembali ke Dasbor'),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: theme.elevatedButtonTheme.style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
