import 'package:flutter/material.dart';
import '../widgets/NavBar.dart';
import '../screens/home.dart';
import '../screens/favourite.dart';
import '../screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';

class Stationlist extends StatefulWidget {
  const Stationlist({ Key? key }) : super(key: key);

  @override
  _StationlistState createState() => _StationlistState();
}

class _StationlistState extends State<Stationlist> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('รายชื่อสถานี'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/stationlistimage.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("                                   รายชื่อสถานี",
                        style: GoogleFonts.prompt(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ),
      )
      
    );
  }
}