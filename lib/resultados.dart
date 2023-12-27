import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_final/DatabaseManager.dart';
import 'package:projeto_final/profileController.dart';
import 'package:projeto_final/user_model.dart';

class ResultadosPage extends StatefulWidget {
  final String jobName;
  const ResultadosPage({Key? key, required this.jobName});

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  final user = FirebaseAuth.instance.currentUser!;

  List userList = [];
  List filteredUserList = [];

  Future<List> fetchDatabaseList() async {
    try {
      final result = await FirebaseFirestore.instance.collection('users').get();

      if (result.docs.isNotEmpty) {
        for (var doc in result.docs) {
          // Access the 'jobs' array
          List<dynamic> jobsList = doc['jobs'];

          if (jobsList.isNotEmpty) {
            // Access each job inside the array
            for (var job in jobsList) {
              // Access fields inside each job
              dynamic exp = job['exp'];
              dynamic jobDescription = job['jobDescription'];
              dynamic jobName = job['jobName'];
              dynamic price = job['price'];

              if (jobName == widget.jobName) {
                userList.add(doc.data());
              }
            }
          } else {
            print('Jobs list is empty for user ${doc.id}');
          }
        }
      } else {
        print('No documents found');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: GestureDetector(
              onTap: () {
                print("Back button clicked");
                Navigator.pushNamed(context, '/homepage');
              },
              child: Container(
                  width: physicalScreenSize.width,
                  height: physicalScreenSize.height,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
                  child: FutureBuilder(
                    future: fetchDatabaseList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // If the Future is still running, show a loading indicator
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // If there is an error, display it
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        // If the Future is complete, build the ListView
                        return Stack(children: [
                          Positioned(
                            left: 25,
                            top: 45,
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
                            left: physicalScreenSize.width / 2 - 310 / 2,
                            top: 120,
                            child: const SizedBox(
                              width: 310,
                              height: 200,
                              child: Text(
                                'We found the best services for you!',
                                textAlign: TextAlign.center,
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
                          Padding(
                              padding: EdgeInsets.only(top: 300, bottom: 20),
                              child: ListView.builder(
                                itemCount: userList.length,
                                itemBuilder: (context, index) {
                                  final user = userList[index];
                                  int jobIndex = -1;
                                  // Find the index of the job with the specified jobName
                                  for (int i = 0;
                                      i < user['jobs'].length;
                                      i++) {
                                    if (user['jobs'][i]['jobName'] ==
                                        widget.jobName) {
                                      jobIndex = i;
                                      break;
                                    }
                                  }
                                  return ListTile(
                                    subtitle: jobIndex != -1
                                        ? Container(
                                            width: 310,
                                            height: 150,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left:
                                                      physicalScreenSize.width /
                                                              2 -
                                                          343 / 2,
                                                  top: 0,
                                                  child: Container(
                                                    width: 310,
                                                    height: 150,
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left:
                                                      physicalScreenSize.width /
                                                              2 -
                                                          343 / 2,
                                                  child: Container(
                                                    width: 130,
                                                    height: 150,
                                                    decoration: ShapeDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "https://via.placeholder.com/130x150"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 150,
                                                  top: 15,
                                                  child: SizedBox(
                                                    width: 168,
                                                    height: 25,
                                                    child: Text(
                                                      user['name'],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 21,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 150,
                                                  top: 65,
                                                  child: SizedBox(
                                                    width: 149,
                                                    height: 88,
                                                    child: Text(
                                                      ('Price: ${user['jobs'][jobIndex]['price']}€/hour'),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 150,
                                                  top: 85,
                                                  child: SizedBox(
                                                    width: 155,
                                                    height: 88,
                                                    child: Text(
                                                      ('Experience: ${user['jobs'][jobIndex]['exp']} years'),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 215,
                                                  top: 90,
                                                  child: SizedBox(
                                                    width: 155,
                                                    height: 88,
                                                    child: IconButton(
                                                        icon: Icon(Icons
                                                            .arrow_forward_rounded),
                                                        onPressed: () {
                                                          print('Pressed');
                                                        }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Text('No job with specified name'),
                                  );
                                },
                              ))
                        ]);
                      }
                    },
                  )))),
    ));
  }
}
