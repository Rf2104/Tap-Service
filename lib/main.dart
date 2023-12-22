import 'package:flutter/material.dart';
import 'package:projeto_final/resultados.dart';
import 'package:projeto_final/search.dart';
import 'login.dart';
import 'register.dart';
import 'editprofile.dart';
import 'profile.dart';
import 'resultados.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: const LoginPage(),
    routes: {
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/editprofile': (context) => const EditProfilePage(),
      '/profile': (context) => const ProfilePage(),
      '/search': (context) => const SearchPage(),
      '/resultados': (context) => const ResultadosPage(),
    },
  ));
}
