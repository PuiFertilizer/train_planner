import 'package:flutter/material.dart';
import 'package:train_planner/screens/stationTouristAttractions.dart';
import 'package:google_fonts/google_fonts.dart';

class AttractionsDetails extends StatefulWidget {
  final Destination destination;

  AttractionsDetails({required this.destination});

  @override
  _AttractionsDetailsState createState() => _AttractionsDetailsState();
}

class _AttractionsDetailsState extends State<AttractionsDetails> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        //title: Text('ผลการค้นหาเพิ่มในแผน', style: GoogleFonts.prompt(color: Colors.black),),  
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[ //ชื่อสถานที่
                      Text('รายละเอียดสถานที่', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                            fontWeight: FontWeight.bold,),),
                      Row( //หัวใจรายการโปรด
                        children: <Widget>[         
                        ],
                      ),
                    ],
                  ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
               height: 5, 
              color: Color.fromARGB(255, 128,	237,	153), 
          ),
          ),
          Container(
               height: 15, 
              color: Color.fromARGB(255, 255, 255, 255), 
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                      )),
                ),
              )
            ],
          ),
          Container(
            height: 10, 
            color: Color.fromARGB(255, 255, 255, 255), 
          ),
          Container(
            height: 20, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[ //ชื่อสถานที่
                      Text(widget.destination.locationName, style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                            fontWeight: FontWeight.bold,),),
                      Row( //หัวใจรายการโปรด
                        children: <Widget>[         
                        ],
                      ),
                    ],
                  ),
            ),
          ),
          Container(
            height: 50, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      Image.asset('assets/images/description.png',height: 30,),
                      SizedBox(width: 10,),
                      Text('คำอธิบายโดยย่อ', style: GoogleFonts.prompt(color: Colors.black,fontSize: 16,
                            fontWeight: FontWeight.bold,),),
                      
                    ],
                  ),
            ),
          ),
          Container(
            height: 80, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      Text(widget.destination.description, maxLines: 5,style: GoogleFonts.prompt(color: Colors.black,fontSize: 12,
                            ),),
                      
                    ],
                  ),
            ),
          ),
          Container(
            height: 40, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      Image.asset('assets/images/walking.png',height: 30,),
                      SizedBox(width: 20,),
                      Text('วิธีไปจากสถานี', style: GoogleFonts.prompt(color: Colors.black,fontSize: 16,
                            fontWeight: FontWeight.bold,),),
                      
                    ],
                  ),
            ),
          ),
         Container(
            height: 20, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      
                      Text(widget.destination.howtotravel, style: GoogleFonts.prompt(color: Colors.black,fontSize: 12,
                      ),),
                      
                    ],
                  ),
            ),
          ),
          Container(
            height: 50, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      Image.asset('assets/images/map.png',height: 40,),
                      SizedBox(width: 10,),
                      Text('พิกัดที่ตั้ง', style: GoogleFonts.prompt(color: Colors.black,fontSize: 16,
                            fontWeight: FontWeight.bold,),),
                      
                    ],
                  ),
            ),
          ),
          Container(
            height: 20, 
            color: Color.fromARGB(255, 255, 255, 255), 
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ //ชื่อสถานที่
                      
                      Text(widget.destination.locationaddress, style: GoogleFonts.prompt(color: Colors.black,fontSize: 12,
                      ),),
                      
                    ],
                  ),
            ),
          ),
          


        ]),
    );
  }
}