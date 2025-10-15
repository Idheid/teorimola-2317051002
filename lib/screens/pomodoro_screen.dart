import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  // Untuk saat ini, ini adalah nilai statis. Logika timer akan ditambahkan nanti.
  String _waktuTampilan = "25:00";
  bool _sesiAktif = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sesi Fokus'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimerDisplay(theme),
              const SizedBox(height: 48),
              _buildControlButtons(theme),
              const SizedBox(height: 24),
              _buildSesiIndicator(theme),
              const SizedBox(height: 48),
              _buildFinishSessionButton(context, theme), // Widget diganti namanya
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerDisplay(ThemeData theme) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 0.75, // Nilai statis
            strokeWidth: 9,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
          ),
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

  Widget _buildControlButtons(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.refresh, size: 30),
          onPressed: () {},
          color: Colors.grey.shade500,
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _sesiAktif = !_sesiAktif;
            });
          },
          icon: Icon(_sesiAktif ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 32),
          label: Text(_sesiAktif ? 'Jeda' : 'Mulai'),
          style: theme.elevatedButtonTheme.style?.copyWith(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 40, vertical: 18)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.skip_next_rounded, size: 30),
          onPressed: () {},
          color: Colors.grey.shade500,
        ),
      ],
    );
  }

  Widget _buildSesiIndicator(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Sesi Fokus #1',
        style: theme.textTheme.titleSmall
            ?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget diubah untuk kembali ke dasbor
  Widget _buildFinishSessionButton(BuildContext context, ThemeData theme) {
    return TextButton.icon(
      // Ikon diubah
      icon: const Icon(Icons.check_circle_outline),
      // Label diubah
      label: const Text('Selesai Sesi'),
      onPressed: () {
        // Kembali ke layar sebelumnya (HomeScreen)
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
