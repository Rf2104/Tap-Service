<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/firebase/firebase_auth.dart';
import 'package:projeto_final/pages/user_model.dart';
import 'package:projeto_final/user_repository/user_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool obscurePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  @override
  void dispose() {
    // Limpa os controladores quando o widget é removido da árvore de widgets
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: physicalScreenSize.width,
          height: 820,
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
                    180 / 2, // Center horizontally
                top: 285,
                child: const SizedBox(
                  width: 180,
                  height: 62,
                  child: Text(
                    'Register',
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
                            controller: nameController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
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
                top: 520,
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
                left: physicalScreenSize.width / 2 -
                    327 / 2, // Center horizontally
                top: 590,
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
                            controller: confirmPasswordController,
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
                              hintText: 'Confirm Password',
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
                top: 670,
                child: Container(
                  width: 327,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _signUp, // Chama a função de login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9744C), // Cor do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
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
                    190 / 2, // Center horizontally
                top: 740,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const SizedBox(
                    width: 200,
                    height: 42,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFFF9744C),
                              fontSize: 16,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
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
                      textAlign: TextAlign.center,
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

  Future<void> _signUp() async {
    // Obtém os valores dos controladores de email e senha
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String name = nameController.text;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (password != confirmPassword) {
      // Senhas não conferem
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (password.length < 6) {
      // Senha muito curta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (name.length < 3) {
      // Nome muito curto
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Name must be at least 3 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (!email.contains('@')) {
      // Email inválido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Attempt to create a new user with the provided email and password
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User created successfully");

        // User registration was successful, now create user data in your repository
        final userData = UserModel(
          name: name.trim(),
          email: email.trim(),
          password: password.trim(),
          location: '',
          aboutMe: '',
          jobs: [],
          dms: [],
        );

        await userRepo.createUser(userData);
        Navigator.pushNamed(context, '/homepage');
      }
    } catch (e) {
      // Check if the exception is due to email already in use
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        // User already exists, log them in instead
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email already in use'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      } else {
        // Handle other exceptions if needed
        print("User creation failed: $e");
      }
    }
  }
}
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/firebase/firebase_auth.dart';
import 'package:projeto_final/pages/user_model.dart';
import 'package:projeto_final/user_repository/user_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool obscurePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  @override
  void dispose() {
    // Limpa os controladores quando o widget é removido da árvore de widgets
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: physicalScreenSize.width,
          height: 820,
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
                    180 / 2, // Center horizontally
                top: 285,
                child: const SizedBox(
                  width: 180,
                  height: 62,
                  child: Text(
                    'Register',
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
                            controller: nameController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
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
                top: 520,
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
                left: physicalScreenSize.width / 2 -
                    327 / 2, // Center horizontally
                top: 590,
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
                            controller: confirmPasswordController,
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
                              hintText: 'Confirm Password',
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
                top: 670,
                child: Container(
                  width: 327,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _signUp, // Chama a função de login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9744C), // Cor do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
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
                    190 / 2, // Center horizontally
                top: 740,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const SizedBox(
                    width: 200,
                    height: 42,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFFF9744C),
                              fontSize: 16,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
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
                      textAlign: TextAlign.center,
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

  Future<void> _signUp() async {
    // Obtém os valores dos controladores de email e senha
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String name = nameController.text;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (password != confirmPassword) {
      // Senhas não conferem
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (password.length < 6) {
      // Senha muito curta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (name.length < 3) {
      // Nome muito curto
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Name must be at least 3 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (!email.contains('@')) {
      // Email inválido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Attempt to create a new user with the provided email and password
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User created successfully");

        // User registration was successful, now create user data in your repository
        final userData = UserModel(
          name: name.trim(),
          email: email.trim(),
          password: password.trim(),
          location: '',
          aboutMe: '',
          jobs: [],
          dms: [],
        );

        await userRepo.createUser(userData);
        Navigator.pushNamed(context, '/homepage');
      }
    } catch (e) {
      // Check if the exception is due to email already in use
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        // User already exists, log them in instead
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email already in use'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      } else {
        // Handle other exceptions if needed
        print("User creation failed: $e");
      }
    }
  }
}
>>>>>>> 290c64f384b0f449362d68a379691b8048f7b93a
