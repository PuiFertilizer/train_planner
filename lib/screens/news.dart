import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 204, 153),
        title: Text(
          'ข่าวสารรถไฟ',
          style: GoogleFonts.prompt(),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/newsimage.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: <Widget>[
                const SizedBox(height: 170.0),
                Text(
                  '   ข่าวประชาสัมพันธ์',
                  style: GoogleFonts.prompt(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: const <Widget>[
                    SizedBox(
                      height: 500,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
