import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/user_model.dart';

class ResultadosPage extends StatefulWidget {
  const ResultadosPage({Key? key});

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: SingleChildScrollView(
              child: Center(
                  child: Container(
        width: physicalScreenSize.width,
        height: physicalScreenSize.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
        child: Stack(),
      ))))
    ]));
  }
}
