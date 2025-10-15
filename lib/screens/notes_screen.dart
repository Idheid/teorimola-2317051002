import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Belajar', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTodoItem(context, 'Matematika', 'Besok, 10:00', 'Kerjakan latihan soal Bab 5'),
          _buildTodoItem(context, 'Fisika', 'Besok, 14:00', 'Baca rangkuman gerak lurus'),
          _buildTodoItem(context, 'Bahasa Inggris', 'Lusa, 09:00', 'Hafalkan 20 vocab baru'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTodoItem(BuildContext context, String title, String time, String target) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            const SizedBox(height: 4),
            Text('Target: $target'),
          ],
        ),
        trailing: Checkbox(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
