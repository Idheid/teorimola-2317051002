import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Halaman untuk membuat task baru (tugas/kegiatan), berisi form input judul, waktu, kategori, dan deskripsi
class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ambil tema aplikasi untuk konsistensi gaya

    return Scaffold(
      appBar: AppBar(
        // Tombol kembali ke halaman sebelumnya
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('New Task'), // Judul halaman
        actions: [
          // Tombol pencarian (belum diimplementasikan)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      // Konten utama berupa form input yang dapat discroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input judul tugas
            _buildTextField(label: 'Title', initialValue: 'UI Design'),
            const SizedBox(height: 20),
            // Label tanggal dan nilai tanggal statis (belum terhubung dengan date picker)
            Text(
              'Date',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              'Tuesday, 22 Sep 2020',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Baris untuk memilih waktu mulai dan waktu selesai
            Row(
              children: [
                Expanded(
                  child: _buildTimeField(context, label: 'Start Time', time: '1:00 PM'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildTimeField(context, label: 'End Time', time: '3:00 PM'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Input deskripsi tugas
            _buildTextField(
              label: 'Description',
              initialValue: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            // Pilihan kategori tugas dalam bentuk chip
            _buildCategorySection(theme),
            const SizedBox(height: 40),
            // Tombol utama untuk membuat task baru
            _buildCreateTaskButton(theme),
          ],
        ),
      ),
    );
  }

  // Komponen input teks serbaguna (judul dan deskripsi)
  Widget _buildTextField({required String label, required String initialValue, int maxLines = 1}) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
      ),
      style: GoogleFonts.lato(), // Gunakan font Lato untuk kesan modern dan rapi
    );
  }

  // Komponen input waktu (start dan end time), sementara hanya tampilan statis
  Widget _buildTimeField(BuildContext context, {required String label, required String time}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Tempat untuk menambahkan fungsi memilih waktu (mis. TimePicker)
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time, style: theme.textTheme.titleMedium),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Bagian kategori tugas — menggunakan widget Chip untuk pilihan kategori
  Widget _buildCategorySection(ThemeData theme) {
    final List<String> categories = ['Meeting', 'UI Design', 'Dev', 'HTML', 'Android App', 'SEO'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: categories.map((category) => Chip(
            label: Text(
              category,
              style: GoogleFonts.lato(
                color: category == 'UI Design' ? Colors.white : theme.primaryColor,
              ),
            ),
            backgroundColor: category == 'UI Design' ? theme.primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: theme.primaryColor, width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          )).toList(),
        ),
      ],
    );
  }

  // Tombol untuk mengonfirmasi pembuatan task baru
  Widget _buildCreateTaskButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'New Task',
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
