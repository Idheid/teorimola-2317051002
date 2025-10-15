import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  // Data dummy untuk To-Do List
  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Belajar Kalkulus Lanjutan',
      'dateTime': '25 Okt, 10:00',
      'target': 'Kerjakan soal no. 5-10',
      'isDone': true,
    },
    {
      'title': 'Membaca Bab 4 Fisika',
      'dateTime': '25 Okt, 14:00',
      'target': 'Pahami konsep interferensi cahaya',
      'isDone': false,
    },
    {
      'title': 'Latihan Algoritma',
      'dateTime': '26 Okt, 09:00',
      'target': 'Selesaikan 2 soal di LeetCode',
      'isDone': false,
    },
    {
      'title': 'Menonton Video Tutorial Flutter',
      'dateTime': '26 Okt, 11:00',
      'target': 'Materi State Management',
      'isDone': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Belajar'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          final isDone = task['isDone'] as bool;

          return Card(
            // CardTheme diterapkan secara otomatis
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Transform.scale(
                  scale: 1.2, // Membuat checkbox sedikit lebih besar
                  child: Checkbox(
                    value: isDone,
                    onChanged: (bool? value) {
                      if (value == true) {
                        // Jeda singkat sebelum menghapus untuk efek visual
                        Future.delayed(const Duration(milliseconds: 300), () {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        });
                      } else {
                        // Jika di-uncheck, cukup update state (meskipun kasus ini jarang terjadi jika item langsung hilang)
                        setState(() {
                          _tasks[index]['isDone'] = value!;
                        });
                      }
                    },
                    activeColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                title: Text(
                  task['title'],
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    color: isDone ? Colors.grey.shade500 : theme.textTheme.titleMedium?.color,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.flag_outlined, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Target: ${task['target']}',
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Text(
                  task['dateTime'],
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk membuka halaman tambah tugas baru
        },
        child: const Icon(Icons.add),
        // Gaya dari tema akan diterapkan secara otomatis
      ),
    );
  }
}
