import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  // Data tugas dummy yang sederhana
  static const List<Map<String, dynamic>> _tasks = [
    {'time': '10:00', 'title': 'Belajar Kalkulus Lanjutan', 'isDone': true},
    {'time': '14:00', 'title': 'Membaca Bab 4 Fisika', 'isDone': false},
    {'time': '16:30', 'title': 'Latihan Algoritma', 'isDone': false},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completedTasks = _tasks.where((task) => task['isDone'] as bool).length;
    final totalTasks = _tasks.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progres Jadwal'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildProgressSummaryCard(theme, completedTasks, totalTasks),
          const SizedBox(height: 32),
          Text(
            'Timeline Hari Ini',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildTimeline(theme),
        ],
      ),
    );
  }

  Widget _buildProgressSummaryCard(ThemeData theme, int completed, int total) {
    double progress = total > 0 ? completed / total : 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress Hari Ini', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                Text('$completed/$total Selesai', style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(ThemeData theme) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        final isDone = task['isDone'] as bool;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  task['time'] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 20,
                child: Column(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDone ? theme.primaryColor : Colors.grey.shade300,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 2,
                        color: index == _tasks.length - 1 ? Colors.transparent : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12, left: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDone ? theme.primaryColor.withOpacity(0.05) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isDone ? theme.primaryColor.withOpacity(0.3) : Colors.grey.shade300),
                  ),
                  child: Text(
                    task['title'] as String,
                    style: theme.textTheme.titleMedium?.copyWith(
                      decoration: isDone ? TextDecoration.lineThrough : null,
                      color: isDone ? Colors.grey.shade600 : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
