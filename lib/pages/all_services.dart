import 'package:flutter/material.dart';
import 'package:projeto_final/controllers/searchProfileController.dart';
import 'package:projeto_final/pages/service_details_currentuser.dart';
import 'package:projeto_final/pages/servicedetails.dart';
import 'package:projeto_final/pages/user_model.dart';

class ShowServicesPage extends StatefulWidget {
  final String userId;
  final String currentUserId;
  const ShowServicesPage({Key? key, required this.userId, required this.currentUserId});

  @override
  State<ShowServicesPage> createState() => _ShowServicesPageState();
}

class _ShowServicesPageState extends State<ShowServicesPage> {
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
        child: Container(
          width: physicalScreenSize.width,
          height: physicalScreenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
          child: FutureBuilder(
            future: controller.fetchUserData(widget.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  UserModel userData = snapshot.data as UserModel;
                  return Stack(
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.only(
                          top: 120,
                          left: 20,
                          right: 20,
                          bottom: 20, // Added bottom padding
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: userData.jobs.length,
                        itemBuilder: (context, index) {
                          Job job = userData.jobs[index];
                          String imagePath =
                              jobImages[job.jobName] ?? 'default_image.png';
                          return GestureDetector(
                            onTap: () {
                              if(widget.userId == widget.currentUserId){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceDetailsCurrentUserPage(
                                      jobindex: index,
                                    ),
                                    ),
                                  );
                              }
                              else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceDetailsPage(
                                    jobindex: index,
                                    userId: widget.userId,
                                  ),
                                ),
                              );
                              }
                            },
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 200,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 25,
                                          top: 10,
                                          child: SizedBox(
                                            width: 100,
                                            height: 20,
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
                                          left: 20,
                                          top: 50,
                                          child: Container(
                                            width: 110,
                                            height: 100,
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
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
        ),
      ),
    );
  }
}
