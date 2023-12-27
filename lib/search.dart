import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/homepage.dart';
import 'package:projeto_final/resultados.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1;
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
                  height: 850,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Color(0xFFF9E0CE)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: physicalScreenSize.width / 2 - 310 / 2,
                        top: 58,
                        child: const SizedBox(
                          width: 310,
                          height: 200,
                          child: Text(
                            'What service are you looking for?',
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
                      Positioned(
                        left: physicalScreenSize.width / 2 - 310 / 2,
                        top: 258,
                        child: Container(
                          width: 310,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: SizedBox(
                            width: 310,
                            height: 58,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Search for a service',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 25,
                                    fontFamily: 'Roboto Mono',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        //Plumber
                        left: physicalScreenSize.width / 2 - 155,
                        top: 346,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultadosPage(jobName: "Plumber"),
                              ),
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 145,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: SizedBox(
                                    width: 145,
                                    height: 20,
                                    child: Text(
                                      'Plumber',
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
                                  top: 50,
                                  child: Container(
                                    width: 123,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.asset('assets/plumber.png')
                                            .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: physicalScreenSize.width / 2 + 10,
                        top: 346,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultadosPage(jobName: "Electrician"),
                              ),
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 145,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Stack(children: [
                              Positioned(
                                left: 0,
                                top: 10,
                                child: SizedBox(
                                  width: 145,
                                  height: 20,
                                  child: Text(
                                    'Electrician',
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
                                top: 40,
                                child: Container(
                                  width: 106,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          Image.asset('assets/eletricista.png')
                                              .image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Positioned(
                        //babysitter
                        left: physicalScreenSize.width / 2 - 155,
                        top: 515,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultadosPage(jobName: "Babysitter"),
                              ),
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 145,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: SizedBox(
                                    width: 145,
                                    height: 20,
                                    child: Text(
                                      'Babysitter',
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
                                  left: 15,
                                  top: 40,
                                  child: Container(
                                    width: 111,
                                    height: 101,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            Image.asset('assets/babysitter.png')
                                                .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        //housemaid
                        left: physicalScreenSize.width / 2 + 10,
                        top: 515,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultadosPage(jobName: "Housemaid"),
                              ),
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 145,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: SizedBox(
                                    width: 145,
                                    height: 20,
                                    child: Text(
                                      'Housemaid',
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
                                  left: 15,
                                  top: 40,
                                  child: Container(
                                    width: 106,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.asset('assets/maid.png')
                                            .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: physicalScreenSize.width / 2 - 155,
                        top: 685,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResultadosPage(jobName: "Painter"),
                                ),
                              );
                            },
                            child: Container(
                                width: 145,
                                height: 145,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 10,
                                      child: SizedBox(
                                        width: 145,
                                        height: 20,
                                        child: Text(
                                          'Painter',
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
                                      left: 18,
                                      top: 37,
                                      child: Container(
                                        width: 106,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                Image.asset('assets/pintor.png')
                                                    .image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      Positioned(
                          left: physicalScreenSize.width / 2 + 10,
                          top: 685,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResultadosPage(jobName: "Gardener"),
                                ),
                              );
                            },
                            child: Container(
                              width: 145,
                              height: 145,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: SizedBox(
                                    width: 145,
                                    height: 20,
                                    child: Text(
                                      'Gardener',
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
                                  top: 45,
                                  child: Container(
                                    width: 123,
                                    height: 95,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            Image.asset('assets/jardineiro.png')
                                                .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          )),
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
