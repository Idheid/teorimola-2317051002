import 'package:flutter/material.dart';
import 'package:myapp/screens/main_screen.dart';

// Halaman Login aplikasi
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Ambil tema aplikasi untuk konsistensi gaya

    return Scaffold(
      body: SafeArea( // Pastikan konten tidak menabrak area status bar atau notch
        child: Center(
          // SingleChildScrollView agar tampilan tetap dapat di-scroll jika layar kecil
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Bagian header dengan ikon aplikasi
                Icon(
                  Icons.school_outlined, // Ikon yang relevan dengan konteks belajar
                  size: 60,
                  color: theme.primaryColor,
                ),
                const SizedBox(height: 20),
                // Judul utama login
                Text(
                  'Selamat Datang Kembali',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Subjudul sebagai ajakan login
                Text(
                  'Masuk untuk melanjutkan perjalanan belajarmu.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 48),
                // Input Email dengan label dan ikon
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),
                // Input Password (disembunyikan) dengan ikon kunci
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 16),
                // Tombol teks untuk reset password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Lupa Password?'),
                  ),
                ),
                const SizedBox(height: 32),
                // Tombol utama login
                ElevatedButton(
                  onPressed: () {
                    // Setelah login, pengguna diarahkan ke MainScreen dan menggantikan halaman saat ini
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 40),
                // Bagian ajakan untuk mendaftar jika belum punya akun
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Daftar Sekarang'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
