import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageStage();
}

class _EditProfilePageStage extends State<EditProfilePage> {
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
                width: 360,
                height: 800,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(0xFFF9E0CE)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 25,
                      top: 248,
                      child: Container(
                        width: 310,
                        height: 37,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 12.32,
                              top: 0,
                              child: SizedBox(
                                width: 152.63,
                                height: 26,
                                child: Opacity(
                                  opacity: 0.50,
                                  child: Text(
                                    'Name',
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
                              left: -0,
                              top: 37,
                              child: Container(
                                width: 310,
                                decoration: ShapeDecoration(
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
                      left: 25,
                      top: 321,
                      child: Container(
                        width: 310,
                        height: 37,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 12.32,
                              top: 0,
                              child: SizedBox(
                                width: 152.63,
                                height: 26,
                                child: Opacity(
                                  opacity: 0.50,
                                  child: Text(
                                    'Location',
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
                              left: -0,
                              top: 37,
                              child: Container(
                                width: 310,
                                decoration: ShapeDecoration(
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
                      left: 37,
                      top: 392,
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
                      left: 39,
                      top: 103,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(
                            side:
                                BorderSide(width: 4, color: Color(0xFFD94E28)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 217,
                      top: 134,
                      child: Container(
                        width: 109,
                        height: 39,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 217,
                      top: 140,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: SizedBox(
                          width: 109,
                          height: 39,
                          child: Text(
                            'Save',
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
                    ),
                    Positioned(
                      left: 25,
                      top: 433,
                      child: Container(
                        width: 310,
                        height: 276,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 2, color: Color(0xFFF9744C)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 452,
                      child: SizedBox(
                        width: 286,
                        height: 240,
                        child: Text(
                          'Tell something about you!',
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
                    Positioned(
                      left: 25,
                      top: 39,
                      child: Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          color: Colors.black,
                          iconSize: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
