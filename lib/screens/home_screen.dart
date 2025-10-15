import 'package:flutter/material.dart';
import 'package:myapp/screens/pomodoro_screen.dart';
import 'package:myapp/screens/quiz_screen.dart'; // Impor QuizScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          _buildWelcomeHeader(theme),
          const SizedBox(height: 30),
          _buildStatsSection(theme),
          const SizedBox(height: 30),
          _buildLearningTechniques(context, theme),
          const SizedBox(height: 30),
          _buildTodaysSchedule(theme),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader(ThemeData theme) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Halo, Pengguna!', style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
          Text('Siap untuk produktif hari ini?', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        ]
    );
  }

  Widget _buildStatsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Statistik Belajarmu', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildStatCard(theme, '7 Hari', 'Streak Belajar', Icons.local_fire_department_rounded, theme.primaryColor)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatCard(theme, '45 Menit', 'Rata-rata/Hari', Icons.access_time_rounded, theme.primaryColor)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(ThemeData theme, String value, String label, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(value, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningTechniques(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mulai Sesi Belajar', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildTechniqueButton(
          theme,
          'Mode Pomodoro',
          Icons.timer_outlined,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PomodoroScreen()),
            );
          },
        ),
        const SizedBox(height: 10),
        _buildTechniqueButton(
          theme,
          'Latihan dengan AI',
          Icons.lightbulb_outline,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTechniqueButton(ThemeData theme, String title, IconData icon, VoidCallback onPressed) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, color: theme.primaryColor, size: 32),
              const SizedBox(width: 20),
              Expanded(
                child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodaysSchedule(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jadwal Hari Ini', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            leading: const Icon(Icons.book_outlined, color: Colors.grey),
            title: const Text('Membaca Bab 4 Fisika'),
            subtitle: const Text('10:00 - 11:00'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: TextButton(onPressed: (){}, child: const Text('Lihat semua jadwal')),
        )
      ],
    );
  }
}
