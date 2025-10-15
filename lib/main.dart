import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Konfigurasi tema utama aplikasi Flutter
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFF3A82F8),
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),

      // Skema warna utama aplikasi (primary, secondary, error)
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3A82F8),
        primary: const Color(0xFF3A82F8),
        secondary: const Color(0xFF00BFA5),
        error: const Color(0xFFD32F2F),
      ),

      // Tema teks global dengan Google Fonts (Plus Jakarta Sans)
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(fontSize: 57, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.plusJakartaSans(fontSize: 45, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w600),
        headlineMedium: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w600),
        headlineSmall: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w600),
        titleLarge: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w500),
        titleMedium: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w500),
        titleSmall: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.plusJakartaSans(fontSize: 16),
        bodyMedium: GoogleFonts.plusJakartaSans(fontSize: 14),
        bodySmall: GoogleFonts.plusJakartaSans(fontSize: 12),
        labelLarge: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.bold),
        labelMedium: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold),
        labelSmall: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.bold),
      ),

      // Tema khusus untuk tombol ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3A82F8),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

      // Tema dekorasi input (TextField) untuk tampilan konsisten
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3A82F8), width: 2),
        ),
        labelStyle: GoogleFonts.plusJakartaSans(color: Colors.grey.shade600),
        hintStyle: GoogleFonts.plusJakartaSans(color: Colors.grey.shade500),
      ),

      // Tema AppBar (bagian atas halaman)
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFF3A82F8)),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          color: const Color(0xFF1D2939),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    // Struktur utama aplikasi
    return MaterialApp(
      title: 'Study Buddy',
      theme: theme,                // Gunakan tema yang sudah didefinisikan
      home: const LoginScreen(),   // Halaman pertama aplikasi (login)
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
    );
  }
}
