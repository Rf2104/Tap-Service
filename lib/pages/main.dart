import 'package:flutter/material.dart';
import 'package:projeto_final/firebase/firebase_options.dart';
import 'package:projeto_final/pages/chat_page.dart';
import 'add_services.dart';
import 'all_services.dart';
import 'homepage.dart';
import 'messages_page.dart';
import 'search.dart';
import 'login.dart';
import 'register.dart';
import 'editprofile.dart';
import 'profile.dart';
import 'search_profile.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: const HomePage(initialIndex: 0,),
    routes: {
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/editprofile': (context) => const EditProfilePage(),
      '/profile': (context) => const ProfilePage(),
      '/search': (context) => const SearchPage(),
      '/messages': (context) => const MessagesPage(),
      '/homepage': (context) => const HomePage(initialIndex: 0,),
      '/addservices': (context) => const AddServicePage(),
      '/allservices': (context) => const ShowServicesPage(
            userId: '', currentUserId: '',
          ),
      '/searchprofile': (context) => const SearchProfilePage(
            userId: '',
          ),
    },
  ));
}
