import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/notes_screen.dart';
import 'package:myapp/screens/schedule_screen.dart';
import 'package:myapp/screens/music_screen.dart';
import 'package:myapp/screens/profile_screen.dart';

// Halaman utama setelah login, berfungsi sebagai wadah navigasi utama dengan BottomNavigationBar
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Menyimpan indeks tab navigasi yang aktif

  // Daftar halaman yang akan ditampilkan sesuai tab yang dipilih
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),       // Tab Beranda
    NotesScreen(),      // Tab Catatan
    ScheduleScreen(),   // Tab Jadwal
    MusicScreen(),      // Tab Musik
    ProfileScreen(),    // Tab Profil
  ];

  // Fungsi untuk mengganti tab yang aktif saat item navigasi ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menampilkan halaman sesuai indeks navigasi yang aktif
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Navigasi bawah untuk berpindah antar halaman utama
      bottomNavigationBar: BottomNavigationBar(
        // Item menu navigasi utama aplikasi
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Catatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Musik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, // Tab yang sedang aktif
        selectedItemColor: Theme.of(context).primaryColor, // Warna tab aktif
        unselectedItemColor: Colors.grey, // Warna tab tidak aktif
        showUnselectedLabels: true, // Tampilkan label meskipun tidak aktif
        onTap: _onItemTapped, // Aksi ketika item ditekan
        type: BottomNavigationBarType.fixed, // Semua tab selalu terlihat (tidak bergeser)
      ),
    );
  }
}
