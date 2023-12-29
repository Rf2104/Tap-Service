import 'package:flutter/material.dart';
import 'package:projeto_final/controllers/searchProfileController.dart';
import 'package:projeto_final/pages/user_model.dart';

class ServiceDetailsPage extends StatefulWidget {
  final int jobindex;

  final String userId;

  const ServiceDetailsPage(
      {Key? key, required this.jobindex, required this.userId});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  final controller = SearchProfileController();

  final Map<String, String> jobImages = {
    'Plumber': 'assets/plumber.png',
    'Electrician': 'assets/eletricista.png',
    'Gardener': 'assets/jardineiro.png',
    'Painter': 'assets/pintor.png',
    'BabySitter': 'assets/babysitter.png',
    'Housemaid': 'assets/maid.png',
  };

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: physicalScreenSize.width,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
            child: FutureBuilder(
              future: controller.fetchUserData(widget.userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data != null) {
                    UserModel userData = snapshot.data as UserModel;
                    return _buildServiceDetails(
                        widget.jobindex, userData, physicalScreenSize);
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
          ),
        ),
      ),
    );
  }

  Widget _buildServiceDetails(
      int jobindex, UserModel userData, Size screensize) {
    Job job = userData.jobs[jobindex];
    String imagePath = jobImages[job.jobName] ?? 'default_image.png';
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
                print("Back button clicked");
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              iconSize: 40,
            ),
          ),
        ),
        Positioned(
          left: screensize.width / 2 - 180 / 2,
          top: 120,
          child: Container(
            width: 180,
            height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 17,
                  child: SizedBox(
                    width: 120,
                    height: 22,
                    child: Text(
                      job.jobName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Roboto Mono',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 60,
                  child: Container(
                    width: 130,
                    height: 120,
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
        ),
        Positioned(
          left: screensize.width / 2 - 310 / 2,
          top: 320,
          child: Container(
            width: 310,
            height: 150,
            child: Stack(children: [
              Positioned(
                child: Container(
                  width: 150,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: SizedBox(
                          width: 150,
                          height: 55,
                          child: Text(
                            'Experience',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF9744C),
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
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
                top: 70,
                child: Container(
                  width: 150,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: SizedBox(
                          width: 150,
                          height: 55,
                          child: Text(
                            'Price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF9744C),
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
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
                left: screensize.width / 2 - 40 / 2,
                child: Container(
                  width: 150,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: SizedBox(
                          width: 150,
                          height: 55,
                          child: Text(
                            job.exp + ' years',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
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
                top: 70,
                left: screensize.width / 2 - 40 / 2,
                child: Container(
                  width: 150,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: SizedBox(
                          width: 150,
                          height: 55,
                          child: Text(
                            job.price + '€/hour',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        Positioned(
          left: 25,
          top: 470,
          child: Container(
            width: 310,
            height: 276,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 310,
                    height: 276,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFF9744C)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 19,
                  child: SizedBox(
                    width: 286,
                    height: 240,
                    child: Text(
                      job.jobDescription,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6000000238418579),
                        fontSize: 20,
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
      ],
    );
  }
}
