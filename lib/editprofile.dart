import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/user_model.dart';
import 'package:hovering/hovering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState(); // Fixed typo here
}

class _EditProfilePageState extends State<EditProfilePage> {
  final controller = Get.put(ProfileController());
  final email = TextEditingController();
  final name = TextEditingController();
  final location = TextEditingController();
  final aboutMe = TextEditingController();
  final jobs = TextEditingController();
  final imageController = TextEditingController();
  final password = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  bool isImageSelected = false;
  File? imageFile;
  late String imageName = ""; // Declare the image name variable
  late Image profileImage;
  late String id;
  late UserModel userData;
  bool first = false;
  bool loaded = false;

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

  _pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        imageName = DateTime.now().millisecondsSinceEpoch.toString();

        // Upload image to Firebase Storage
        final firebase_storage.Reference storageReference = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('$imageName.jpg');

        final firebase_storage.UploadTask uploadTask =
            storageReference.putFile(imageFile!);

        await uploadTask.whenComplete(() async {
          // Get the download URL of the uploaded image
          final String downloadURL = await storageReference.getDownloadURL();

          // downloadURL to store in Firestore database
          print('Image uploaded. Download URL: $downloadURL');
        });

        setState(() {
          if (imageFile != null) {
            profileImage = Image.file(imageFile!);
            isImageSelected = true;
          } else {
            isImageSelected = false;
          }
        });
      } else {
        print('User didn\'t pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel> userDataFuture = Future<UserModel>.value(UserModel(
      name: '',
      email: '',
      password: '',
      location: '',
      aboutMe: '',
      jobs: [],
      image: "")); // Change UserModel() to your initial/default user data

  @override
  void initState() {
    super.initState();

    // Fetch user data
    controller.getUserData().then((data) {
      setState(() {
        userData = data;
        id = userData.id ?? '';
        email.text = userData?.email ?? '';
        name.text = userData?.name ?? '';
        location.text = userData?.location ?? '';
        aboutMe.text = userData?.aboutMe ?? '';
        jobs.text = userData?.jobs?.toString() ?? '';
        imageController.text = userData?.image ?? '';
        password.text = userData?.password ?? '';
        ;
        imageName = imageController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: physicalScreenSize.width,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 110, 6)),
          child: Stack(
            children: [
              Container(
                width: physicalScreenSize.width,
                height: 800,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
                child: FutureBuilder(
                  future: userDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data != null) {
                        if (first && snapshot.hasData) {
                          userData = snapshot.data as UserModel;
                          id = userData.id!;
                          email.text = userData.email;
                          name.text = userData.name;
                          location.text = userData.location;
                          aboutMe.text = userData.aboutMe;
                          jobs.text = userData.jobs.toString();
                          imageController.text = userData.image.toString();
                          password.text = userData.password;
                          first = false;
                        }
                        return Stack(
                          children: [
                            Positioned(
                              left: 25,
                              top: 39,
                              child: Container(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/homepage');
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                                  color: Colors.black,
                                  iconSize: 40,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 39,
                              top: 103,
                              child: HoverButton(
                                onpressed: () => _pickImagefromGallery(),
                                child: ClipOval(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: isImageSelected || imageName != ""
                                        ? ClipOval(
                                            child: imageName != "" &&
                                                    isImageSelected == false &&
                                                    !loaded
                                                ? (FutureBuilder(
                                                    future: _getImage(context,
                                                        imageController.text),
                                                    builder:
                                                        (context, snapshot) {
                                                      if ((snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .done) &&
                                                          !loaded) {
                                                        loaded = true;
                                                        profileImage = snapshot
                                                            .data as Image;
                                                        return Center(
                                                            child:
                                                                snapshot.data);
                                                      }
                                                      if ((snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .done) &&
                                                          loaded) {
                                                        return Center(
                                                            child:
                                                                profileImage);
                                                      }
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }
                                                      return const Center(
                                                          child: Text(
                                                              "Something went wrong!"));
                                                    },
                                                  ))
                                                : profileImage != null
                                                    ? Image(
                                                        image:
                                                            profileImage.image,
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                        height: 100,
                                                      )
                                                    : const SizedBox.shrink(),
                                          )
                                        : const Icon(
                                            Icons.add_a_photo,
                                            color: Colors.black,
                                            size: 50,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 217,
                              top: 140,
                              child: SizedBox(
                                width: 109,
                                height: 39,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                      id: id,
                                      name: name.text.trim(),
                                      location: location.text.trim(),
                                      aboutMe: aboutMe.text.trim(),
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      jobs: controller
                                          .parseJobs(jobs.text.trim()),
                                      image: imageController.text.trim(),
                                    );

                                    await controller.updateUser(userData);
                                    await controller.updateUserImage(
                                        imageName, userData);
                                    Navigator.pushNamed(context, '/homepage');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 249, 116, 76),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Save',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: physicalScreenSize.width / 2 - 315 / 2,
                              top: 248,
                              child: Container(
                                width: 310,
                                height: 37,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 15,
                                      top: -5,
                                      child: SizedBox(
                                        width: 300,
                                        height: 52,
                                        child: TextFormField(
                                          controller: name,
                                          minLines: 1,
                                          maxLines: 1,
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
                                              color: Color.fromARGB(
                                                  100, 249, 116, 50),
                                              fontSize: 20,
                                              fontFamily: 'Roboto Mono',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -0,
                                      top: 37,
                                      child: Container(
                                        width: 310,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 3,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
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
                              left: physicalScreenSize.width / 2 - 315 / 2,
                              top: 320,
                              child: Container(
                                width: 310,
                                height: 37,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 15,
                                      top: -5,
                                      child: SizedBox(
                                        width: 300,
                                        height: 52,
                                        child: TextFormField(
                                          controller: location,
                                          minLines: 1,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 20,
                                            fontFamily: 'Roboto Mono',
                                            fontWeight: FontWeight.w700,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Location',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  100, 249, 116, 50),
                                              fontSize: 20,
                                              fontFamily: 'Roboto Mono',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -0,
                                      top: 37,
                                      child: Container(
                                        width: 310,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 3,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
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
                              left: physicalScreenSize.width / 2 - 315 / 2,
                              top: 400,
                              child: Container(
                                  width: physicalScreenSize.width,
                                  height: 500,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 15,
                                        child: SizedBox(
                                          width: 152.63,
                                          height: 26,
                                          child: Opacity(
                                            opacity: 0.50,
                                            child: Text(
                                              'Description',
                                              style: TextStyle(
                                                color: Color(0xFFF9744C),
                                                fontSize: 20,
                                                fontFamily: 'Roboto Mono',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 45,
                                        child: Container(
                                          width: 310,
                                          height: 300,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 249, 116, 76)),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50,
                                        left: 20,
                                        child: SizedBox(
                                          width: 276,
                                          height: 300,
                                          child: TextFormField(
                                            controller: aboutMe,
                                            minLines: 1,
                                            maxLines: 10,
                                            maxLength: 200,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 18,
                                              fontFamily: 'Roboto Mono',
                                              fontWeight: FontWeight.w700,
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'Tell something about you',
                                              hintStyle: TextStyle(
                                                color:
                                                    Color.fromARGB(99, 0, 0, 0),
                                                fontSize: 18,
                                                fontFamily: 'Roboto Mono',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text("Something went wrong!"));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
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
