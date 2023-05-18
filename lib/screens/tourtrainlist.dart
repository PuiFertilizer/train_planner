import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class TourtrainList extends StatefulWidget {
  const TourtrainList({Key? key}) : super(key: key);

  @override
  State<TourtrainList> createState() => _TourtrainListState();
}

class _TourtrainListState extends State<TourtrainList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 204, 153),
        title: Text(
          'โปรแกรมท่องเที่ยวทางรถไฟ',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/CSY5213.jpg",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
