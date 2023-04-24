import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../widgets/NavBar.dart';
import '../screens/home.dart';
import '../screens/favourite.dart';
import '../screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/plan.dart';
import '../screens/searchresult.dart';

class TourtrainList extends StatefulWidget {
  const TourtrainList({Key? key}) : super(key: key);

  @override
  _TourtrainListState createState() => _TourtrainListState();
}

class _TourtrainListState extends State<TourtrainList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text(
          'โปรแกรมท่องเที่ยวทางรถไฟ',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/CSY5213.jpg",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
