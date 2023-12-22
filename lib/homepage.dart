import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_final/messages.dart';
import 'package:projeto_final/profile.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/search.dart';
import 'package:projeto_final/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    SearchPage(),
    MessagesPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFFD94E28),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 40,
          backgroundColor: Color(0xFFF9E0CE),
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Messages',
            ),
          ],
        ));
  }

  void _handleNavBarItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
