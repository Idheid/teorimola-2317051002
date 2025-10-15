import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  // Nilai sementara untuk tampilan waktu Pomodoro (belum ada logika hitung mundur)
  final String _waktuTampilan = "25:00";
  // Menandakan apakah sesi fokus sedang berjalan atau tidak
  bool _sesiAktif = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // Judul halaman Pomodoro
        title: const Text('Sesi Fokus'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilan utama hitungan waktu
              _buildTimerDisplay(theme),
              const SizedBox(height: 48),
              // Tombol kontrol untuk mulai, jeda, reset, dan skip
              _buildControlButtons(theme),
              const SizedBox(height: 24),
              // Penanda sesi fokus keberapa
              _buildSesiIndicator(theme),
              const SizedBox(height: 48),
              // Tombol untuk mengakhiri sesi dan kembali ke halaman utama
              _buildFinishSessionButton(context, theme),
            ],
          ),
        ),
      ),
    );
  }

  // Bagian tampilan hitungan waktu + progress lingkaran
  Widget _buildTimerDisplay(ThemeData theme) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Progress bar melingkar, masih nilai statis
          CircularProgressIndicator(
            value: 0.75,
            strokeWidth: 9,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
          ),
          // Teks waktu di tengah
          Center(
            child: Text(
              _waktuTampilan,
              style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Baris tombol kontrol: reset, play/pause, skip
  Widget _buildControlButtons(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol reset waktu
        IconButton(
          icon: const Icon(Icons.refresh, size: 30),
          onPressed: () {},
          color: Colors.grey.shade500,
        ),
        const SizedBox(width: 20),
        // Tombol mulai atau jeda sesi fokus
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _sesiAktif = !_sesiAktif;
            });
          },
          icon: Icon(_sesiAktif ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 32),
          label: Text(_sesiAktif ? 'Jeda' : 'Mulai'),
          style: theme.elevatedButtonTheme.style?.copyWith(
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 40, vertical: 18)),
            shape: WidgetStateProperty.all(const StadiumBorder()),
          ),
        ),
        const SizedBox(width: 20),
        // Tombol untuk skip ke sesi berikutnya
        IconButton(
          icon: const Icon(Icons.skip_next_rounded, size: 30),
          onPressed: () {},
          color: Colors.grey.shade500,
        ),
      ],
    );
  }

  // Tampilan label sesi aktif
  Widget _buildSesiIndicator(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Sesi Fokus #1',
        style: theme.textTheme.titleSmall
            ?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Tombol untuk menyelesaikan sesi dan kembali ke halaman sebelumnya
  Widget _buildFinishSessionButton(BuildContext context, ThemeData theme) {
    return TextButton.icon(
      icon: const Icon(Icons.check_circle_outline),
      label: const Text('Selesai Sesi'),
      onPressed: () {
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
