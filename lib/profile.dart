import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_final/messages.dart';
import 'package:projeto_final/homepage.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/search.dart';
import 'package:projeto_final/servicedetails.dart';
import 'package:projeto_final/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final Map<String, String> jobImages = {
  'Plumber': 'assets/plumber.png',
  'Electrician': 'assets/eletricista.png',
  'Gardener': 'assets/jardineiro.png',
  'Painter': 'assets/pintor.png',
  'BabySitter': 'assets/babysitter.png',
  'Housemaid': 'assets/maid.png',
};

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
                                      left: 35,
                                      top: 445,
                                      child: SizedBox(
                                        width: 80,
                                        height: 32,
                                        child: Text(
                                          'Services ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 25,
                                      top: 258,
                                      child: Container(
                                        width: 310,
                                        height: 170,
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
                                                    fontWeight: FontWeight.w700,
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
                                                    fontWeight: FontWeight.w400,
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
                                                  icon: Icon(Icons.location_on),
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
                                                    fontWeight: FontWeight.w700,
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
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  return Center(
                                                      child: snapshot.data);
                                                }
                                                if (snapshot.connectionState ==
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
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 2),
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
                                                  Navigator.pushNamed(
                                                      context, '/editprofile');
                                                },
                                                child: const SizedBox(
                                                  width: 109,
                                                  height: 39,
                                                  child: Text(
                                                    'Edit profile',
                                                    textAlign: TextAlign.center,
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
                                    _showServices(user, physicalScreenSize),
                                    Positioned(
                                      left: 120,
                                      top: 439,
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: IconButton(
                                          onPressed: () {
                                            print("Add services");
                                            Navigator.pushNamed(
                                                context, '/addservices');
                                          },
                                          icon: Icon(Icons.add_box),
                                          color: Colors.black,
                                          iconSize: 20,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 25,
                                      top: 440,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/allservices');
                                            print("All Services");
                                          },
                                          icon: Icon(Icons.more_horiz_rounded),
                                          color: Colors.black,
                                          iconSize: 25,
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
        ],
      ),
    );
  }
}

Widget _showServices(UserModel userData, Size physicalScreenSize) {
  return userData.jobs.isEmpty
      ? Positioned(
          left: physicalScreenSize.width / 2 - 150,
          top: 490,
          child: Container(
            width: 140,
            height: 140,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFFD94E28)),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                'No Services',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ))
      : Positioned(
          left: physicalScreenSize.width / 2 - 150,
          top: 450,
          child: SizedBox(
            width: 300,
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
              ),
              itemCount: userData.jobs.length > 2 ? 2 : userData.jobs.length,
              itemBuilder: (context, index) {
                Job job = userData.jobs[index];
                return _buildJobWidget(
                    job, context, index, userData.jobs.length);
              },
            ),
          ),
        );
}

Widget _buildJobWidget(Job job, BuildContext context, int index, int jobs) {
  String imagePath = jobImages[job.jobName] ?? 'default_image.png';
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailsPage(jobindex: index),
        ),
      );
    },
    child: Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 22,
            top: 10,
            child: SizedBox(
              width: 100,
              height: 22,
              child: Text(
                job.jobName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 35,
            child: Container(
              width: 115,
              height: 105,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class FirebaseStorageService extends ChangeNotifier {
  FirebaseStorageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
