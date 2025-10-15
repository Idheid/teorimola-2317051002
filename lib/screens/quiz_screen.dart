import 'package:flutter/material.dart';
import 'package:myapp/screens/quiz_result_screen.dart'; // Impor layar hasil

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'Apa konsep utama yang menjelaskan bagaimana dua gelombang cahaya dapat bergabung untuk menciptakan pola terang dan gelap?',
      'answers': [
        {'text': 'Difraksi', 'isCorrect': false},
        {'text': 'Refraksi', 'isCorrect': false},
        {'text': 'Interferensi', 'isCorrect': true},
        {'text': 'Polarisasi', 'isCorrect': false},
      ],
    },
  ];

  int _questionIndex = 0;
  int? _selectedIndex;
  bool? _isCurrentAnswerCorrect; // Untuk menyimpan status jawaban

  void _answerQuestion(int selectedIndex, bool isCorrect) {
    setState(() {
      _selectedIndex = selectedIndex;
      _isCurrentAnswerCorrect = isCorrect; // Simpan apakah jawaban benar
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final question = _questions[_questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis AI: Fisika Bab 4'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pertanyaan ${_questionIndex + 1}/${_questions.length}',
                style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildQuestionCard(theme, question['questionText']),
              const SizedBox(height: 24),
              ..._buildAnswerOptions(theme, question['answers']),
              const SizedBox(height: 32),
              _buildShowResultButton(theme), // Tombol diubah
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(ThemeData theme, String questionText) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          questionText,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<Widget> _buildAnswerOptions(ThemeData theme, List<Map<String, dynamic>> answers) {
    return List.generate(answers.length, (index) {
      final answer = answers[index];
      bool isSelected = _selectedIndex == index;

      Color? tileColor;
      Icon? trailingIcon;

      if (isSelected) {
        if (answer['isCorrect']) {
          tileColor = Colors.green.shade100;
          trailingIcon = const Icon(Icons.check_circle, color: Colors.green);
        } else {
          tileColor = Colors.red.shade100;
          trailingIcon = const Icon(Icons.cancel, color: Colors.red);
        }
      }

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        color: tileColor,
        child: ListTile(
          onTap: () => _answerQuestion(index, answer['isCorrect'] as bool),
          leading: CircleAvatar(
            backgroundColor: isSelected ? (answer['isCorrect'] ? Colors.green : Colors.red) : theme.primaryColor,
            child: Text(
              String.fromCharCode(65 + index),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(answer['text'], style: theme.textTheme.bodyLarge),
          trailing: trailingIcon,
        ),
      );
    });
  }

  // Nama dan fungsi widget diubah
  Widget _buildShowResultButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: _selectedIndex != null
          ? () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizResultScreen(
                    isCorrect: _isCurrentAnswerCorrect ?? false,
                    totalQuestions: _questions.length,
                  ),
                ),
              );
            }
          : null,
      child: const Text('Lihat Hasil'), // Label diubah
      style: theme.elevatedButtonTheme.style?.copyWith(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
      ),
    );
  }
}
