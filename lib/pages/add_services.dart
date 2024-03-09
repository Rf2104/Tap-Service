import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projeto_final/controllers/profileController.dart';
import 'package:projeto_final/pages/user_model.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({Key? key});

  @override
  State<AddServicePage> createState() =>
      _AddServicePageState(); // Fixed typo here
}

class _AddServicePageState extends State<AddServicePage> {
  final controller = Get.put(ProfileController());
  final professionController = TextEditingController();
  final moneyController = TextEditingController();
  final experienceController = TextEditingController();
  final descriptionController = TextEditingController();
  late String id;
  late String email;
  late String name;
  late String location;
  late String aboutMe;
  late String password;
  late String image;
  late String jobs;
  bool first = false;
  late UserModel userData;

  Future<UserModel> userDataFuture = Future<UserModel>.value(UserModel(
      name: '',
      email: '',
      password: '',
      location: '',
      aboutMe: '',
      jobs: [],
      image: "")); // Change U

  @override
  void initState() {
    super.initState();

    // Fetch user data
    controller.getUserData().then((data) {
      setState(() {
        userData = data;
        id = userData.id ?? '';
        email = userData?.email ?? '';
        name = userData?.name ?? '';
        location = userData?.location ?? '';
        aboutMe = userData?.aboutMe ?? '';
        jobs = userData?.jobs?.toString() ?? '';
        image = userData?.image ?? '';
        password = userData?.password ?? '';
      });
    });
  }

  final List<String> professions = [
    'Plumber',
    'Housemaid',
    'Electrician',
    'Gardener',
    'Painter',
    'BabySitter',
  ];

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: physicalScreenSize.width,
      height: 740,
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
                email = userData.email;
                name = userData.name;
                location = userData.location;
                aboutMe = userData.aboutMe;
                jobs = userData.jobs.toString();
                image = userData.image.toString();
                password = userData.password;
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
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.black,
                        iconSize: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 217,
                    top: 50,
                    child: SizedBox(
                      width: 109,
                      height: 39,
                      child: ElevatedButton(
                        onPressed: () async {
                          await addService();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 249, 116, 76),
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
                    left: physicalScreenSize.width / 2 - 327 / 2,
                    top: 150,
                    child: Container(
                      width: 327,
                      height: 37,
                      child: Stack(children: [
                        Positioned(
                            left: 15,
                            top: -5,
                            child: SizedBox(
                              width: 300,
                              height: 52,
                              child: Autocomplete<String>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  return professions.where((String option) {
                                    return option.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                onSelected: (String selected) {
                                  professionController.text = selected;
                                },
                                fieldViewBuilder: (
                                  BuildContext context,
                                  TextEditingController
                                      fieldTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted,
                                ) {
                                  return TextField(
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                    onSubmitted: (value) {
                                      onFieldSubmitted();
                                    },
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 20,
                                      fontFamily: 'Roboto Mono',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Profession',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(100, 249, 116, 50),
                                        fontSize: 20,
                                        fontFamily: 'Roboto Mono',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
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
                      ]),
                    ),
                  ),
                  Positioned(
                    left: physicalScreenSize.width / 2 -
                        327 / 2, // Center horizontally
                    top: 220,
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
                                  controller: moneyController,
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
                                    hintText: 'Money/hour',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(100, 249, 116, 50),
                                      fontSize: 20,
                                      fontFamily: 'Roboto Mono',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(
                                        r'^\d{1,2}\.?\d{0,1}')), // Allow one dot and at most one digit after the dot
                                  ]),
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
                    top: 290,
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
                                  controller: experienceController,
                                  autofocus: false,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontFamily: 'Roboto Mono',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Years of experience',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(100, 249, 116, 50),
                                      fontSize: 20,
                                      fontFamily: 'Roboto Mono',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(
                                        r'^\d{1,2}\.?\d{0,1}')), // Allow one dot and at most one digit after the dot
                                  ]),
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
                    left: physicalScreenSize.width / 2 - 315 / 2,
                    top: 360,
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
                              top: 35,
                              child: Container(
                                width: 310,
                                height: 300,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 249, 116, 76)),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 20,
                              child: SizedBox(
                                width: 276,
                                height: 300,
                                child: TextFormField(
                                  controller: descriptionController,
                                  minLines: 1,
                                  maxLines: 10,
                                  maxLength: 200,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontFamily: 'Roboto Mono',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Why should people hire you?',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(99, 0, 0, 0),
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
              return const Center(child: Text("Something went wrong!"));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    )));
  }

  Future<void> addService() async {
    if (professionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid profession!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (experienceController.text.isEmpty ||
        moneyController.text.isEmpty ||
        professionController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      // Use Get.snackbar with the current context
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final newJob = Job(
      exp: experienceController.text,
      price: moneyController.text,
      jobName: professionController.text,
      jobDescription: descriptionController.text,
    );

    // Append the new job to the existing list of jobs
    final List<Job> updatedJobs = List.from(userData.jobs)..add(newJob);

    final updatedUserData = UserModel(
      id: id,
      name: name,
      email: email,
      password: password,
      location: location,
      aboutMe: aboutMe,
      jobs: updatedJobs,
      image: image,
    );

    await controller.updateUserJobs(updatedJobs, updatedUserData);
    Navigator.pushNamed(context, '/homepage');
  }
}
