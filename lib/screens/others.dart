import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_planner/screens/stationlist.dart';
import 'package:train_planner/screens/tourtrainlist.dart';
import 'package:train_planner/screens/trainlist.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news.dart';

class Others extends StatefulWidget {
  const Others({ Key? key }) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('ข้อมูลเพิ่มเติม', style: GoogleFonts.prompt(color: Colors.black),),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  SizedBox(height: 190.0) ,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.newspaper, size: 35,),
                                    const SizedBox(
                                      width: 5,
                                    ), // <-- Icon
                                    Flexible(
                                      child: Text(
                                        "ข่าวประชาสัมพันธ์",
                                        style: GoogleFonts.prompt(fontSize: 13),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Stationlist()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.account_balance, size: 35,), ////
                                    // <-- Icon
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "รายชื่อสถานี",
                                        style: GoogleFonts.prompt(fontSize: 14),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  
                    ],),
                  ),
                  SizedBox(height: 10.0) ,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => TourtrainList()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.tour, size: 35,),
                                    const SizedBox(
                                      width: 5,
                                    ), // <-- Icon
                                    Flexible(
                                      child: Text(
                                        "โปรแกรมท่องเที่ยวทางรถไฟ",
                                        style: GoogleFonts.prompt(fontSize: 14),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Trainlist()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.train, size: 35,),
                                    // <-- Icon
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "รายชื่อขบวนรถ",
                                        style: GoogleFonts.prompt(fontSize: 14),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  
                    ],),
                  ),
                  SizedBox(height: 10.0) ,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                               //Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.route, size: 35,),
                                    const SizedBox(
                                      width: 5,
                                    ), // <-- Icon
                                    Flexible(
                                      child: Text(
                                        "เส้นทางเดินรถ",
                                        style: GoogleFonts.prompt(fontSize: 14),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(context.mediaQuery.size.width*0.4, 60),
                          child: Material(
                            color: const Color.fromARGB(255, 199, 249, 204),
                            child: InkWell(
                              //splashColor: Colors.green,
                              onTap: () {
                               //Navigator.push(context, MaterialPageRoute(builder: (context) => Stationlist()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.access_time_filled, size: 35,),
                                    // <-- Icon
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "กำหนดเวลาเดินรถ",
                                        style: GoogleFonts.prompt(fontSize: 14),
                                      ),
                                    ), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  
                    ],),
                  ),
                ],
              ),
              
            ],
          )
        ),
      )
    );
  }
}