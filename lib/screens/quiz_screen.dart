import 'package:flutter/material.dart';
import 'package:myapp/screens/quiz_result_screen.dart'; // Impor layar hasil kuis

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Daftar pertanyaan kuis (sementara hanya 1 soal contoh)
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

  final int _questionIndex = 0; // Indeks pertanyaan aktif (sementara 1)
  int? _selectedIndex; // Menyimpan jawaban yang dipilih
  bool? _isCurrentAnswerCorrect; // Menyimpan status jawaban benar atau salah

  // Fungsi untuk menangani saat jawaban dipilih
  void _answerQuestion(int selectedIndex, bool isCorrect) {
    setState(() {
      _selectedIndex = selectedIndex;
      _isCurrentAnswerCorrect = isCorrect;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final question = _questions[_questionIndex]; // Ambil pertanyaan aktif

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis AI: Fisika Bab 4'),
        automaticallyImplyLeading: false, // Hilangkan tombol back default
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Teks indikator posisi soal
              Text(
                'Pertanyaan ${_questionIndex + 1}/${_questions.length}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Kartu pertanyaan
              _buildQuestionCard(theme, question['questionText']),
              const SizedBox(height: 24),

              // Opsi jawaban ditampilkan dalam bentuk list
              ..._buildAnswerOptions(theme, question['answers']),
              const SizedBox(height: 32),

              // Tombol untuk menampilkan hasil kuis
              _buildShowResultButton(theme),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan pertanyaan dalam Card
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

  // Widget untuk membuat daftar opsi jawaban
  List<Widget> _buildAnswerOptions(ThemeData theme, List<Map<String, dynamic>> answers) {
    return List.generate(answers.length, (index) {
      final answer = answers[index];
      bool isSelected = _selectedIndex == index; // Cek apakah opsi ini dipilih

      Color? tileColor;
      Icon? trailingIcon;

      // Jika jawaban dipilih, ubah warna background dan tampilkan ikon benar/salah
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
            backgroundColor: isSelected
                ? (answer['isCorrect'] ? Colors.green : Colors.red)
                : theme.primaryColor,
            child: Text(
              String.fromCharCode(65 + index), // Tampilkan A, B, C, D
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(answer['text'], style: theme.textTheme.bodyLarge),
          trailing: trailingIcon,
        ),
      );
    });
  }

  // Tombol untuk berpindah ke halaman hasil kuis
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
          : null, // Nonaktif jika belum memilih jawaban
      style: theme.elevatedButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
      ),
      child: const Text('Lihat Hasil'),
    );
  }
}
