import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  // Data dummy untuk To-Do List (sementara, sebelum ada integrasi data dinamis)
  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Belajar Kalkulus Lanjutan',
      'dateTime': '25 Okt, 10:00',
      'target': 'Kerjakan soal no. 5-10',
      'isDone': false,
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
        // Judul halaman
        title: const Text('Catatan Belajar'),
      ),
      // List tugas ditampilkan menggunakan ListView.builder agar efisien
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          final isDone = task['isDone'] as bool;

          return Card(
            // Tampilan tiap tugas dalam bentuk kartu
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                // Checkbox untuk menandai tugas selesai
                leading: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: isDone,
                    onChanged: (bool? value) {
                      if (value == true) {
                        // Jika dicentang, hapus tugas setelah jeda pendek untuk efek visual
                        Future.delayed(const Duration(milliseconds: 300), () {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        });
                      } else {
                        // Jika status dicabut, perbarui state
                        setState(() {
                          _tasks[index]['isDone'] = value!;
                        });
                      }
                    },
                    activeColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                // Judul tugas, dicoret jika tugas sudah selesai
                title: Text(
                  task['title'],
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    color: isDone ? Colors.grey.shade500 : theme.textTheme.titleMedium?.color,
                  ),
                ),
                // Target tugas ditampilkan sebagai subtitle dengan ikon
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
                // Tanggal dan waktu tugas
                trailing: Text(
                  task['dateTime'],
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ),
            ),
          );
        },
      ),
      // Tombol untuk menambahkan tugas baru (belum ada navigasi)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk membuka halaman tambah tugas baru
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
