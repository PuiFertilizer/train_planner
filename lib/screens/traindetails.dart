import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:train_planner/models/result_model.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';


class TrainDetails extends StatefulWidget {


  @override
  _TrainDetailsState createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
    appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('ผลการค้นหา', style: GoogleFonts.prompt(color: Colors.black),),
        bottom: TabBar(tabs: [
              Tab(text: 'ช่วงเวลา',icon: Icon(Icons.time_to_leave),),
              Tab(text: 'รายละเอียดขบวน',icon: Icon(Icons.train),),
              Tab(text: 'ราคา',icon: Icon(Icons.price_change),),
        ]),
    ),
    body: Column(
      children: [
        Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('ผลการค้นหา', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80,),
              
              // Positioned(
                
              // ),
              
              
            ],
          ),
      ],
    ),
    )   
  );
  
}