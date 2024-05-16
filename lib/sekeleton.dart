import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/list_page.dart';

class Sekeleton extends StatefulWidget {
  const Sekeleton({super.key});

  @override
  State<Sekeleton> createState() => _SekeletonState();
}

class _SekeletonState extends State<Sekeleton> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    ListPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Finance App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Color(0xFF1176A5), // Warna item yang dipilih
        unselectedItemColor: Color(0xFF08415C),
        selectedIconTheme: IconThemeData(color: Color(0xFF1176A5)),
        unselectedIconTheme: IconThemeData(color: Color(0xFF08415C)),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'List',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
