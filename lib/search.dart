import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  State<SearchPage> createState() => _SearchPageStage();
}

class _SearchPageStage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final physicalScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: physicalScreenSize.width,
        height: 950,
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
              left: 25,
              top: 346,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 188,
              top: 346,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 515,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 188,
              top: 515,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 685,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 188,
              top: 685,
              child: Container(
                width: 145,
                height: 145,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 188,
              top: 356,
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
              left: 206,
              top: 387,
              child: Container(
                width: 111,
                height: 101,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/babysitter.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 25,
              top: 531,
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
              left: 41,
              top: 558,
              child: Container(
                width: 106,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/eletricista.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 188,
              top: 530,
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
              left: 209,
              top: 558,
              child: Container(
                width: 106,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/maid.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 25,
              top: 360,
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
              left: 37,
              top: 404,
              child: Container(
                width: 123,
                height: 86,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/plumber.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 25,
              top: 700,
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
              left: 45,
              top: 717,
              child: Container(
                width: 106,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/pintor.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 188,
              top: 696,
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
              left: 200,
              top: 732,
              child: Container(
                width: 123,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/jardineiro.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 360,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: Icon(Icons.person),
                      color: Colors.black,
                      iconSize: 50,
                    ),
                    ClipOval(
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Color(0xFFD94E28),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/search');
                          },
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          iconSize: 50,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: Icon(Icons.local_post_office),
                      color: Colors.black,
                      iconSize: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
