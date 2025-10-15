import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final bool isCorrect;
  final int totalQuestions;

  const QuizResultScreen({
    super.key,
    required this.isCorrect,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final score = isCorrect ? 1 : 0;
    final message = isCorrect ? "Luar Biasa!" : "Coba Lagi, ya!";
    final icon = isCorrect ? Icons.check_circle_outline : Icons.highlight_off;
    final iconColor = isCorrect ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(icon, color: iconColor, size: 100),
              const SizedBox(height: 24),
              Text(
                message,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Skor Anda:',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                '$score / $totalQuestions',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
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
