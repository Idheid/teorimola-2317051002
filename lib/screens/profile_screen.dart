import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          _buildProfileHeader(theme),
          const SizedBox(height: 30),
          _buildMenuList(context, theme),
          const SizedBox(height: 40),
          _buildLogoutButton(context, theme),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: theme.primaryColor.withOpacity(0.1),
          child: Icon(Icons.person_outline, size: 40, color: theme.primaryColor),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adrianne Julian Claresta',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'adrianne.julian@email.com',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuList(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        _buildMenuCard(theme, 'Pengaturan Akun', Icons.settings_outlined, () {}),
        _buildMenuCard(theme, 'Notifikasi', Icons.notifications_none_rounded, () {}),
        _buildMenuCard(theme, 'Pusat Bantuan', Icons.help_outline_rounded, () {}),
        _buildMenuCard(theme, 'Tentang Aplikasi', Icons.info_outline_rounded, () {}),
      ],
    );
  }

  Widget _buildMenuCard(ThemeData theme, String title, IconData icon, VoidCallback onTap) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: theme.primaryColor),
        title: Text(title, style: theme.textTheme.titleMedium),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false,
          );
        },
        icon: const Icon(Icons.logout, color: Colors.redAccent),
        label: const Text(
          'Keluar',
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red.withOpacity(0.2))
            )
        ),
      ),
    );
  }
}
