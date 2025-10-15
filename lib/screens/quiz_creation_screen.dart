import 'package:flutter/material.dart';
import 'package:myapp/screens/quiz_screen.dart';

class QuizCreationScreen extends StatelessWidget {
  const QuizCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ambil tema aplikasi untuk konsistensi gaya tampilan

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Kuis AI'), // Judul halaman
        leading: IconButton(
          icon: const Icon(Icons.close), // Tombol kembali (close)
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ikon utama di bagian atas halaman
            Icon(Icons.psychology_outlined, size: 50, color: theme.primaryColor),
            const SizedBox(height: 16),

            // Judul besar halaman
            Text(
              'Uji Pemahamanmu',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Deskripsi singkat tentang fitur AI kuis
            Text(
              'Tempelkan materimu di bawah, dan biarkan AI membuatkan kuis untukmu.',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Area input teks tempat pengguna menempelkan materi
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Tempelkan ringkasan, catatan, atau teks dari buku di sini...',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol untuk memproses pembuatan kuis dan pindah ke halaman QuizScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text('Buat Kuis'),
            )
          ],
        ),
      ),
    );
  }
}
