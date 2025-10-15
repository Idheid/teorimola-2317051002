import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis AI', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMultipleChoiceQuestion(context),
            const SizedBox(height: 30),
            _buildEssayQuestion(context),
            const SizedBox(height: 40),
             ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Selesai & Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleChoiceQuestion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Siapakah penemu bola lampu?',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        RadioListTile(
          title: const Text('Albert Einstein'),
          value: 1,
          groupValue: _selectedAnswer,
          onChanged: (val) {
            setState(() {
              _selectedAnswer = val as int;
            });
          },
        ),
        RadioListTile(
          title: const Text('Thomas Edison'),
          value: 2,
          groupValue: _selectedAnswer,
          onChanged: (val) {
            setState(() {
              _selectedAnswer = val as int;
            });
          },
        ),
        RadioListTile(
          title: const Text('Isaac Newton'),
          value: 3,
          groupValue: _selectedAnswer,
          onChanged: (val) {
            setState(() {
              _selectedAnswer = val as int;
            });
          },
        ),
      ],
    );
  }

  Widget _buildEssayQuestion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2. Jelaskan secara singkat proses fotosintesis!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        const TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Tulis jawabanmu di sini...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
