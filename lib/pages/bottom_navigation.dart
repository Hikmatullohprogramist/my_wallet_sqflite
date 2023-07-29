// ignore_for_file: use_full_hex_values_for_flutter_colors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_wallet_sqflite/pages/home/home_page.dart';
import 'package:my_wallet_sqflite/pages/setting/settings.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> _pages = [
    const HomePage(),
    const SettingScreen(),
  ];

  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        currentIndex: selected_index,
        selectedIconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 32,
            ),
            label: "Settings",
          ),
        ],
        onTap: (value) {
          setState(() {
            selected_index = value;
          });
        },
      ),
      backgroundColor: Colors.grey[300],
      body: _pages[selected_index],
    );
  }
}
