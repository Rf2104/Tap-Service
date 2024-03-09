import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/firebase/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageStage();
}

class _LoginPageStage extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool obscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Limpa os controladores quando o widget é removido da árvore de widgets
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: physicalScreenSize.width,
          height: physicalScreenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF9E0CE)),
          child: Stack(
            children: [
              Positioned(
                left: physicalScreenSize.width / 2 -
                    201 / 2, // Center horizontally
                top: 70,
                child: Container(
                  width: 201,
                  height: 198,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/logo.png').image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: physicalScreenSize.width / 2 -
                    115 / 2, // Center horizontally
                top: 285,
                child: const SizedBox(
                  width: 115,
                  height: 62,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFFD94E28),
                      fontSize: 45,
                      fontFamily: 'Roboto Mono',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: physicalScreenSize.width / 2 -
                    327 / 2, // Center horizontally
                top: 380,
                child: Container(
                  width: 327,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15,
                        top: -5,
                        child: SizedBox(
                          width: 300,
                          height: 52,
                          child: TextField(
                            minLines: 1,
                            maxLines: 1,
                            controller: emailController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(100, 249, 116, 50),
                                fontSize: 20,
                                fontFamily: 'Roboto Mono',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 37,
                        child: Container(
                          width: 327,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFF9744C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: physicalScreenSize.width / 2 -
                    327 / 2, // Center horizontally
                top: 450,
                child: Container(
                  width: 327,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15,
                        top: -5,
                        child: SizedBox(
                          width: 300,
                          height: 52,
                          child: TextField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            autofocus: false,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(100, 249, 116, 50),
                                fontSize: 20,
                                fontFamily: 'Roboto Mono',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 37,
                        child: Container(
                          width: 327,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFF9744C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: physicalScreenSize.width / 2 - 327 / 2,
                top: 530,
                child: Container(
                  width: 327,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _signIn, // Chama a função de login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9744C), // Cor do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto Mono',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: physicalScreenSize.width / 2 -
                    150 / 2, // Center horizontally
                top: 600,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 20,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'New here? ',
                            style: TextStyle(
                              color: Color(0xFFF9744C),
                              fontSize: 16,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: Color(0xFFD94E28),
                              fontSize: 16,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    // Obtém os valores dos controladores de email e senha
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      print("User signed in!");
      Navigator.pushNamed(context, '/homepage');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Address or Password is incorrect!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
