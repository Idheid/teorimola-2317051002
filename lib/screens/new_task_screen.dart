import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('New Task'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(label: 'Title', initialValue: 'UI Design'),
            const SizedBox(height: 20),
            Text('Date', style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text('Tuesday, 22 Sep 2020', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildTimeField(context, label: 'Start Time', time: '1:00 PM')),
                const SizedBox(width: 20),
                Expanded(child: _buildTimeField(context, label: 'End Time', time: '3:00 PM')),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(label: 'Description', initialValue: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', maxLines: 3),
            const SizedBox(height: 20),
            _buildCategorySection(theme),
            const SizedBox(height: 40),
            _buildCreateTaskButton(theme),
          ],
        ),
      ),
    );
  }

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
      style: GoogleFonts.lato(),
    );
  }

  Widget _buildTimeField(BuildContext context, {required String label, required String time}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Aksi untuk memilih waktu
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
            label: Text(category, style: GoogleFonts.lato(color: category == 'UI Design' ? Colors.white : theme.primaryColor)),
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

  Widget _buildCreateTaskButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
        ),
        child: Text('New Task', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
