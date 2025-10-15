import 'package:flutter/material.dart';

// Halaman Playlist Musik — menampilkan daftar playlist yang bisa dipilih pengguna
class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  // Data playlist contoh (dummy) untuk ditampilkan pada daftar
  final List<Map<String, dynamic>> _playlists = const [
    {
      'name': 'Fokus Penuh',
      'songCount': 15,
      'duration': '1 jam 5 menit',
    },
    {
      'name': 'Belajar Santai',
      'songCount': 20,
      'duration': '1 jam 30 menit',
    },
    {
      'name': 'Lo-Fi Coding',
      'songCount': 25,
      'duration': '2 jam',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ambil tema untuk konsistensi gaya tampilan

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist Musik'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            // Tombol untuk membuat playlist baru
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Buat Playlist Baru'),
              ),
            ),
            const SizedBox(height: 16),
            // ListView menampilkan seluruh playlist yang tersedia
            Expanded(
              child: ListView.builder(
                itemCount: _playlists.length, // jumlah item sesuai data dummy
                itemBuilder: (context, index) {
                  final playlist = _playlists[index]; // Ambil playlist sesuai index
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      // Thumbnail playlist (ikon musik dalam kotak berwarna)
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.queue_music_rounded,
                          color: theme.primaryColor,
                          size: 28,
                        ),
                      ),
                      // Nama playlist
                      title: Text(
                        playlist['name'],
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      // Jumlah lagu dan durasi playlist
                      subtitle: Text(
                        '${playlist['songCount']} lagu ・ ${playlist['duration']}',
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                      ),
                      // Tombol play di sisi kanan tiap playlist
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow_rounded, color: theme.primaryColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
