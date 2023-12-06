import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageStage();
}

class _ProfilePageStage extends State<ProfilePage> {
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
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: physicalScreenSize.width,
                                height: 227,
                                decoration:
                                    BoxDecoration(color: Color(0xCCD94E28)),
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
                                    borderRadius: BorderRadius.circular(50),
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
                                              .withOpacity(0.6000000238418579),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0xFFD94E28)),
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                            fontWeight: FontWeight.w700,
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
                                          icon: Icon(Icons.more_horiz_rounded),
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
                                          'Tell something about you!',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(
                                                0.6000000238418579),
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
                                          'Location',
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
                                height: 20,
                                child: Text(
                                  'Your name',
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
                              top: 116,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 4, color: Color(0xFFD94E28)),
                                  ),
                                ),
                              ),
                            ),
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
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/editprofile');
                                        },
                                        child: const SizedBox(
                                          width: 109,
                                          height: 39,
                                          child: Text(
                                            'Edit',
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
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 30,
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
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushNamed(
                                              context, '/login');
                                        },
                                        child: SizedBox(
                                          width: 109,
                                          height: 39,
                                          child: Text(
                                            'Sign out',
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: physicalScreenSize.width,
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFFF9E0CE),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Container(
                    width: 55,
                    height: 55,
                    color: Color(0xFFD94E28),
                    child: Transform.translate(
                      offset: Offset(-3.0, 0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        icon: Icon(Icons.person),
                        color: Colors.white,
                        iconSize: 45,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  iconSize: 45,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: Icon(Icons.local_post_office),
                  color: Colors.black,
                  iconSize: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
