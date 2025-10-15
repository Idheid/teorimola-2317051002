import 'package:flutter/material.dart';
import 'package:myapp/screens/quiz_screen.dart';

class QuizCreationScreen extends StatelessWidget {
  const QuizCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Kuis AI'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.psychology_outlined, size: 50, color: theme.primaryColor),
            const SizedBox(height: 16),
            Text(
              'Uji Pemahamanmu',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Tempelkan materimu di bawah, dan biarkan AI membuatkan kuis untukmu.',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
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
