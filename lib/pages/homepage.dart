import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/pages/login.dart';
import 'package:projeto_final/pages/messages_page.dart';
import 'package:projeto_final/pages/profile.dart';
import 'package:projeto_final/pages/search.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<_HomePageState> homePageKey = GlobalKey<_HomePageState>();

  final user = FirebaseAuth.instance.currentUser;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    SearchPage(),
    MessagesPage(),
  ];

  _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {

    if (user == null) {
      // Se não houver usuário autenticado, redirecione para a tela de login
      return const LoginPage();
    }
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar,
          currentIndex: _currentIndex,
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
}
