import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_final/messages.dart';
import 'package:projeto_final/homepage.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/search.dart';
import 'package:projeto_final/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());
  final email = TextEditingController();
  final name = TextEditingController();
  final location = TextEditingController();
  final aboutMe = TextEditingController();
  final jobs = TextEditingController();
  final imageController = TextEditingController();
  final password = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    return FirebaseStorageService.loadImage(context, imageName).then((value) {
      return Image.network(
        value.toString(),
        fit: BoxFit.cover,
        width: 100, // Defina a largura desejada
        height: 100, // Defina a altura desejada
      );
    });
  }

  Future<void> _navigateToEditProfile(BuildContext context) async {
  // Display CircularProgressIndicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Simulate some processing time
  await Future.delayed(Duration(seconds: 2));

  // Navigate to the edit profile page
  Navigator.pop(context); // Close the CircularProgressIndicator
  Navigator.pushNamed(context, '/editprofile');
}

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: physicalScreenSize.width,
                  height: physicalScreenSize.height,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
                  child: Stack(
                    children: [
                      Container(
                        width: physicalScreenSize.width,
                        height: physicalScreenSize.height,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
                        child: FutureBuilder(
                            future: controller.getUserData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  final UserModel user =
                                      snapshot.data as UserModel;
                                  return Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: physicalScreenSize.width,
                                          height: 227,
                                          decoration: BoxDecoration(
                                              color: Color(0xCCD94E28)),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 175,
                                        child: Container(
                                          width: physicalScreenSize.width,
                                          height: 585,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFF9E0CE),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 33,
                                        top: 483,
                                        child: Container(
                                          width: 125,
                                          height: 125,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 125,
                                                  height: 125,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white
                                                        .withOpacity(
                                                            0.6000000238418579),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: Color(
                                                              0xFFD94E28)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Center(
                                                  child: Text(
                                                    'No Services',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 25,
                                        top: 422,
                                        child: Container(
                                          width: 340,
                                          height: 32,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 109.92,
                                                  height: 32,
                                                  child: Text(
                                                    'Services ',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 100,
                                                top: -4,
                                                child: Container(
                                                  width: 20,
                                                  height: 25,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.add_box),
                                                    color: Colors.black,
                                                    iconSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 40,
                                                top: -7,
                                                child: Container(
                                                  width: 21,
                                                  height: 28,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .more_horiz_rounded),
                                                    color: Colors.black,
                                                    iconSize: 25,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 25,
                                        top: 258,
                                        child: Container(
                                          width: 310,
                                          height: 198,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 7.95,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 302.05,
                                                  height: 29,
                                                  child: Text(
                                                    'About me',
                                                    style: TextStyle(
                                                      color: Color(0xFFD94E28),
                                                      fontSize: 20,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 37,
                                                child: SizedBox(
                                                  width: 281.38,
                                                  height: 161,
                                                  child: Text(
                                                    controller.getAboutMe(user),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 134,
                                        top: 216,
                                        child: Container(
                                          width: 193,
                                          height: 100,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: -5,
                                                top: -7,
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        Icon(Icons.location_on),
                                                    color: Colors.black,
                                                    iconSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 23,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 170,
                                                  height: 18,
                                                  child: Text(
                                                    user.location,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 134,
                                        top: 185,
                                        child: SizedBox(
                                          width: 154,
                                          height: 30,
                                          child: Text(
                                            user.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          left: 25,
                                          top: 116,
                                          child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFF9E0CE),
                                                border: Border.all(
                                                  color: Colors
                                                      .black, // Set your desired border color here
                                                  width:
                                                      2.0, // Set your desired border width here
                                                ),
                                              ),
                                              child: ClipOval(
                                                  child: FutureBuilder(
                                                future: _getImage(
                                                    context, user.image!),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return Center(
                                                        child: snapshot.data);
                                                  }
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                  return const Center(
                                                      child: Text(
                                                          "Something went wrong!"));
                                                },
                                              )))),
                                      Positioned(
                                        left: 224,
                                        top: 113,
                                        child: Container(
                                          width: 109,
                                          height: 39,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 109,
                                                  height: 39,
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side:
                                                          BorderSide(width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 9,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(context, '/editprofile');
                                                  },
                                                  child: const SizedBox(
                                                    width: 109,
                                                    height: 39,
                                                    child: Text(
                                                      'Edit profile',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //Sign out button icon
                                      Positioned(
                                        left: 15,
                                        top: 50,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: IconButton(
                                            onPressed: () {
                                              FirebaseAuth.instance.signOut();
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            },
                                            icon: Icon(Icons.logout),
                                            color: Colors.black,
                                            iconSize: 35,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(snapshot.error.toString()));
                                } else {
                                  return const Center(
                                      child: Text("Something went wrong!"));
                                }
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
