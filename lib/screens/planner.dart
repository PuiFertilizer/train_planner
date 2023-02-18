import 'package:flutter/material.dart';
import '../widgets/NavBar.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/plan.dart';

import '../widgets/Tourtrain_Carousel.dart';
class Planner extends StatefulWidget {
  const Planner({ Key? key }) : super(key: key);

  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('แผนการเดินทาง', style: GoogleFonts.prompt(color: Colors.black),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/pasak.jpg",
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
                        Text("แผนการเดินทางที่กำลังมาถึง",
                        style: GoogleFonts.prompt(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            Column(
                       
            children: <Widget>[
              
              SizedBox(height: 150.0) ,
              Plan(), //รายชื่อแผนการเดินทาง และปุ่มใหญ่ด้านล่าง
              

            ],
            
          ) ,
              
            ],
            
          ),

        ),
      )
    );
  }
}
// IconButton(
// icon: Icon(Icons.arrow_back),
// iconSize: 30.0,
// color: Colors.black,
// onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())),
// )