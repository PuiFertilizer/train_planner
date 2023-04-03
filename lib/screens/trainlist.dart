import 'package:flutter/material.dart';
import 'package:train_planner/screens/traindetails.dart';
import '../widgets/NavBar.dart';
import '../screens/home.dart';
import '../screens/favourite.dart';
import '../screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';

class Trainlist extends StatefulWidget {
  const Trainlist({ Key? key }) : super(key: key);

  @override
  _TrainlistState createState() => _TrainlistState();
}

class _TrainlistState extends State<Trainlist> {
  
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 87, 204, 153),
          title: Text('รายชื่อขบวนรถทุกสาย'),
          
        ),
        body: Column(
          children: <Widget>[
            Image.asset("assets/images/trainlist.jpg",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: Color.fromARGB(255, 87, 204, 153),
              child: TabBar(
              indicatorColor: Colors.black,  
              labelColor: Colors.black,
              labelStyle: GoogleFonts.prompt(
                    color: Colors.black,
                    fontSize: 13,
                  ),
              tabs: [
              Tab(text: 'สายเหนือ',),
              Tab(text: 'สายอีสาน',),
              Tab(text: 'สายตะวันออก',),
              Tab(text: 'สายใต้',)
                      ],),
            ),
            Expanded(

              child: TabBarView(
                children: [
                  Container( //tab ที่ 1 

              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Text('สายเหนือ' ,style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 14.0,
                  ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 5, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Container(
              height: 45,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  color: const Color(0xff009889),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "ขบวน",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              "ต้นทาง (เวลาออก)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "ปลายทาง (เวลาถึง)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        
                        
                        
                      ]),
                ),
              ),
            ),
            SizedBox(height: 5,),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 395,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  child: RawScrollbar(
                                    thumbColor: const Color.fromARGB(
                                        255, 132, 132, 132),
                                    radius: const Radius.circular(20),
                                    thickness: 5,
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: northTrainLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          NorthTrainList
                                              northTrainList =
                                              northTrainLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 5.0),
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                                  
                                                  // borderRadius:
                                                  //     BorderRadius.circular(
                                                  //         5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 110,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TrainDetails(
                                                                          train:
                                                                              northTrainList.trainNo)),
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ขบวน ${northTrainList.trainNo}', //เลขขบวน
                                                                style: GoogleFonts.prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                northTrainList
                                                                    .trainType, //ประเภทขบวน
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 215,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  northTrainList
                                                                      .departureStation, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ออก', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  northTrainList
                                                                      .departureTime, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  northTrainList
                                                                      .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ถึง', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  northTrainList
                                                                      .arriveTime, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  
                                                ]),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                          //เนื้อหาตารางใหม่
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container( //tab ที่ 2

              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Text('สายอีสาน (ตะวันออกเฉียงเหนือ)' ,style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 14.0,
                  ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 5, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Container(
              height: 45,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  color: const Color(0xff009889),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "ขบวน",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              "ต้นทาง (เวลาออก)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "ปลายทาง (เวลาถึง)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        
                        
                        
                      ]),
                ),
              ),
            ),
            SizedBox(height: 5,),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 395,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  child: RawScrollbar(
                                    thumbColor: const Color.fromARGB(
                                        255, 132, 132, 132),
                                    radius: const Radius.circular(20),
                                    thickness: 5,
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: northEastTrainLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          NorthEastTrainList
                                              northEastTrainList =
                                              northEastTrainLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 5.0),
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                                  
                                                  // borderRadius:
                                                  //     BorderRadius.circular(
                                                  //         5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 110,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TrainDetails(
                                                                          train:
                                                                              northEastTrainList.trainNo)),
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ขบวน ${northEastTrainList.trainNo}', //เลขขบวน
                                                                style: GoogleFonts.prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                northEastTrainList
                                                                    .trainType, //ประเภทขบวน
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 215,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  northEastTrainList
                                                                      .departureStation, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ออก', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 5,),
                                                                
                                                                Text(
                                                                  northEastTrainList
                                                                      .departureTime, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  northEastTrainList
                                                                      .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ถึง', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  northEastTrainList
                                                                      .arriveTime, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  
                                                ]),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                          //เนื้อหาตารางใหม่
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container( //tab ที่ 3

              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Text('สายตะวันออก' ,style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 14.0,
                  ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 5, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Container(
              height: 45,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  color: const Color(0xff009889),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "ขบวน",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              "ต้นทาง (เวลาออก)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "ปลายทาง (เวลาถึง)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        
                        
                        
                      ]),
                ),
              ),
            ),
            SizedBox(height: 5,),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 395,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  child: RawScrollbar(
                                    thumbColor: const Color.fromARGB(
                                        255, 132, 132, 132),
                                    radius: const Radius.circular(20),
                                    thickness: 5,
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: eastTrainLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          EastTrainList
                                              eastTrainList =
                                              eastTrainLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 5.0),
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                                  
                                                  // borderRadius:
                                                  //     BorderRadius.circular(
                                                  //         5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 110,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TrainDetails(
                                                                          train:
                                                                              eastTrainList.trainNo)),
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ขบวน ${eastTrainList.trainNo}', //เลขขบวน
                                                                style: GoogleFonts.prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                eastTrainList
                                                                    .trainType, //ประเภทขบวน
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 215,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  eastTrainList
                                                                      .departureStation, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ออก', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 5,),
                                                                
                                                                Text(
                                                                  eastTrainList
                                                                      .departureTime, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  eastTrainList
                                                                      .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ถึง', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  eastTrainList
                                                                      .arriveTime, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  
                                                ]),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                          //เนื้อหาตารางใหม่
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  
                  Container( //tab ที่ 4

              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Text('สายใต้' ,style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 14.0,
                  ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 5, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                          Container(
              height: 45,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  color: const Color(0xff009889),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "ขบวน",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            Text(
                              "ต้นทาง (เวลาออก)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "ปลายทาง (เวลาถึง)",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        
                        
                        
                      ]),
                ),
              ),
            ),
            SizedBox(height: 5,),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 395,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Container(
                                  child: RawScrollbar(
                                    thumbColor: const Color.fromARGB(
                                        255, 132, 132, 132),
                                    radius: const Radius.circular(20),
                                    thickness: 5,
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: southTrainLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          SouthTrainList
                                              southTrainList =
                                              southTrainLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 5.0),
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                                  
                                                  // borderRadius:
                                                  //     BorderRadius.circular(
                                                  //         5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 110,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TrainDetails(
                                                                          train:
                                                                              southTrainList.trainNo)),
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ขบวน ${southTrainList.trainNo}', //เลขขบวน
                                                                style: GoogleFonts.prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                southTrainList
                                                                    .trainType, //ประเภทขบวน
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 215,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  southTrainList
                                                                      .departureStation, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ออก', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 5,),
                                                                
                                                                Text(
                                                                  southTrainList
                                                                      .departureTime, //สถานีต้นทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  southTrainList
                                                                      .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                    'ถึง', //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 12.0,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  southTrainList
                                                                      .arriveTime, //สถานีปลายทางแต่ละขบวน
                                                                  style: GoogleFonts
                                                                      .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  
                                                ]),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                          //เนื้อหาตารางใหม่
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                ],
              ),
            ),
          ],
        )
        
      ),
    );
  }

class NorthTrainList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขบวน
  String trainNo; //เลขขบวน
  String trainType; //ประเภทขบวน
  String departureStation; //สถานีต้นทาง
  String departureTime;
  String arriveStation; //สถานีปลายทาง
  String arriveTime;

  NorthTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveTime,
    required this.arriveStation,
    required this.departureTime
  });
}

List<NorthTrainList> northTrainLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NorthTrainList(
      trainNo: '7',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '09:05',arriveStation: 'เชียงใหม่',arriveTime: '19:30'),
  NorthTrainList(
      trainNo: '8',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'เชียงใหม่',departureTime: '08:50',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '18:55'),
  NorthTrainList(
      trainNo: '9',trainType: 'ด่วนพิเศษ CNR',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '18:40',arriveStation: 'เชียงใหม่',arriveTime: '07:15'),    
  NorthTrainList(
      trainNo: '10',trainType: 'ด่วนพิเศษ CNR',departureStation: 'เชียงใหม่',departureTime: '18:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '06:50'),
  NorthTrainList(
      trainNo: '13',trainType: 'ด่วนพิเศษ',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '20:05',arriveStation: 'เชียงใหม่',arriveTime: '08:40'),    
  NorthTrainList(
      trainNo: '14',trainType: 'ด่วนพิเศษ',departureStation: 'เชียงใหม่',departureTime: '17:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '06:10'),
  NorthTrainList(
      trainNo: '51',trainType: 'ด่วน',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '22:30',arriveStation: 'เชียงใหม่',arriveTime: '12:10'),    
  NorthTrainList(
      trainNo: '52',trainType: 'ด่วน',departureStation: 'เชียงใหม่',departureTime: '15:30',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '05:10'),    
  NorthTrainList(
      trainNo: '109',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '14:15',arriveStation: 'เชียงใหม่',arriveTime: '04:05'),    
  NorthTrainList(
      trainNo: '102',trainType: 'เร็ว',departureStation: 'เชียงใหม่',departureTime: '06:30',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '20:25'), 
  NorthTrainList(
      trainNo: '107',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '20:45',arriveStation: 'เด่นชัย',arriveTime: '05:15'),    
  NorthTrainList(
      trainNo: '108',trainType: 'เร็ว',departureStation: 'เด่นชัย',departureTime: '19:05',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '04:30'), 
  NorthTrainList(
      trainNo: '111',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '07:30',arriveStation: 'เด่นชัย',arriveTime: '16:30'),    
  NorthTrainList(
      trainNo: '112',trainType: 'เร็ว',departureStation: 'เด่นชัย',departureTime: '07:30',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '17:20'),  
  NorthTrainList(
      trainNo: '201',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '09:30',arriveStation: 'พิษณุโลก',arriveTime: '17:55'),    
  NorthTrainList(
      trainNo: '202',trainType: 'ธรรมดา',departureStation: 'พิษณุโลก',departureTime: '06:05',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '14:05'),  
  NorthTrainList(
      trainNo: '207',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '14:10',arriveStation: 'นครสวรรค์',arriveTime: '19:35'),    
  NorthTrainList(
      trainNo: '208',trainType: 'ธรรมดา',departureStation: 'นครสวรรค์',departureTime: '05:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '10:15'), 
  NorthTrainList(
      trainNo: '209',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '11:20',arriveStation: 'บ้านตาคลี',arriveTime: '15:40'),    
  NorthTrainList(
      trainNo: '210',trainType: 'ธรรมดา',departureStation: 'บ้านตาคลี',departureTime: '16:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '20:35'), 
  NorthTrainList(
      trainNo: '211',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '12:55',arriveStation: 'ตะพานหิน',arriveTime: '19:15'),    
  NorthTrainList(
      trainNo: '212',trainType: 'ธรรมดา',departureStation: 'ตะพานหิน',departureTime: '05:30',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '12:10'), 
  NorthTrainList(
      trainNo: '301',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '16:30',arriveStation: 'ลพบุรี',arriveTime: '19:40'),    
  NorthTrainList(
      trainNo: '302',trainType: 'ชานเมือง',departureStation: 'ลพบุรี',departureTime: '04:30',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '07:35'), 
  NorthTrainList(
      trainNo: '303',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '04:30',arriveStation: 'ลพบุรี',arriveTime: '07:05'),    
  NorthTrainList(
      trainNo: '304',trainType: 'ชานเมือง',departureStation: 'ลพบุรี',departureTime: '08:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '10:35'), 
  NorthTrainList(
      trainNo: '313',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '18:20',arriveStation: 'ชุมทางบ้านภาชี',arriveTime: '20:45'),    
  NorthTrainList(
      trainNo: '314',trainType: 'ชานเมือง',departureStation: 'ชุมทางบ้านภาชี',departureTime: '04:45',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '06:50'), 
  NorthTrainList(
      trainNo: '317',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '17:30',arriveStation: 'ลพบุรี',arriveTime: '20:20'),    
  NorthTrainList(
      trainNo: '318',trainType: 'ชานเมือง',departureStation: 'ลพบุรี',departureTime: '06:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '08:50'), 
  NorthTrainList(
      trainNo: '401',trainType: 'ท้องถิ่น',departureStation: 'ลพบุรี',departureTime: '06:00',arriveStation: 'พิษณุโลก',arriveTime: '10:55'),    
  NorthTrainList(
      trainNo: '402',trainType: 'ท้องถิ่น',departureStation: 'พิษณุโลก',departureTime: '13:45',arriveStation: 'ลพบุรี',arriveTime: '18:45'), 
  NorthTrainList(
      trainNo: '403',trainType: 'ท้องถิ่น',departureStation: 'พิษณุโลก',departureTime: '05:55',arriveStation: 'ศิลาอาสน์',arriveTime: '07:40'), 
  NorthTrainList(
      trainNo: '410',trainType: 'ท้องถิ่น',departureStation: 'ศิลาอาสน์',departureTime: '16:30',arriveStation: 'พิษณุโลก',arriveTime: '18:10'),    
  NorthTrainList(
      trainNo: '407',trainType: 'ท้องถิ่น',departureStation: 'นครสวรรค์',departureTime: '05:00',arriveStation: 'เชียงใหม่',arriveTime: '14:35'),    
  NorthTrainList(
      trainNo: '408',trainType: 'ท้องถิ่น',departureStation: 'เชียงใหม่',departureTime: '09:30',arriveStation: 'นครสวรรค์',arriveTime: '19:55'), 
      
      
  
];


class NorthEastTrainList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขบวน
  String trainNo; //เลขขบวน
  String trainType; //ประเภทขบวน
  String departureStation; //สถานีต้นทาง
  String departureTime;
  String arriveStation; //สถานีปลายทาง
  String arriveTime;

  NorthEastTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveTime,
    required this.arriveStation,
    required this.departureTime
  });
}

List<NorthEastTrainList> northEastTrainLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NorthEastTrainList(
      trainNo: '21',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '06:15',arriveStation: 'อุบลราชธานี',arriveTime: '14:00'),
  NorthEastTrainList(
      trainNo: '22',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'อุบลราชธานี',departureTime: '14:50',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '22:35'),
  NorthEastTrainList(
      trainNo: '23',trainType: 'ด่วนพิเศษ CNR',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '21:05',arriveStation: 'อุบลราชธานี',arriveTime: '16:35'),
  NorthEastTrainList(
      trainNo: '24',trainType: 'ด่วนพิเศษ CNR',departureStation: 'อุบลราชธานี',departureTime: '19:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '04:50'),
  NorthEastTrainList(
      trainNo: '25',trainType: 'ด่วนพิเศษ CNR',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '20:25',arriveStation: 'อุบลราชธานี',arriveTime: '06:25'),
  NorthEastTrainList(
      trainNo: '26',trainType: 'ด่วนพิเศษ CNR',departureStation: 'อุบลราชธานี',departureTime: '19:40',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '05:50'),
  NorthEastTrainList(
      trainNo: '71',trainType: 'ด่วน',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '10:35',arriveStation: 'อุบลราชธานี',arriveTime: '19:50'),
  NorthEastTrainList(
      trainNo: '72',trainType: 'ด่วน',departureStation: 'อุบลราชธานี',departureTime: '05:40',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '14:30'),
  NorthEastTrainList(
      trainNo: '75',trainType: 'ด่วน',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '08:45',arriveStation: 'หนองคาย',arriveTime: '17:30'),
  NorthEastTrainList(
      trainNo: '76',trainType: 'ด่วน',departureStation: 'หนองคาย',departureTime: '07:45',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '16:35'),
  NorthEastTrainList(
      trainNo: '133',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '21:25',arriveStation: 'หนองคาย',arriveTime: '07:55'),
  NorthEastTrainList(
      trainNo: '134',trainType: 'เร็ว',departureStation: 'หนองคาย',departureTime: '18:50',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '05:30'),
  NorthEastTrainList(
      trainNo: '135',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '07:10',arriveStation: 'อุบลราชธานี',arriveTime: '18:00'),
  NorthEastTrainList(
      trainNo: '136',trainType: 'เร็ว',departureStation: 'อุบลราชธานี',departureTime: '07:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '17:55'),
  NorthEastTrainList(
      trainNo: '139',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '19:25',arriveStation: 'อุบลราชธานี',arriveTime: '06:15'),
  NorthEastTrainList(
      trainNo: '140',trainType: 'เร็ว',departureStation: 'อุบลราชธานี',departureTime: '20:30',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '07:10'),
  NorthEastTrainList(
      trainNo: '141',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '23:05',arriveStation: 'อุบลราชธานี',arriveTime: '10:20'),
  NorthEastTrainList(
      trainNo: '142',trainType: 'เร็ว',departureStation: 'อุบลราชธานี',departureTime: '17:35',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '04:10'),
  NorthEastTrainList(
      trainNo: '233',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '11:40',arriveStation: 'สุรินทร์',arriveTime: '20:00'),    
  NorthEastTrainList(
      trainNo: '234',trainType: 'ธรรมดา',departureStation: 'สุรินทร์',departureTime: '05:20',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '14:15'),  
  NorthEastTrainList(
      trainNo: '339',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '05:20',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '08:05'),    
  NorthEastTrainList(
      trainNo: '340',trainType: 'ชานเมือง',departureStation: 'ชุมทางแก่งคอย',departureTime: '08:45',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '11:10'),  
  NorthEastTrainList(
      trainNo: '341',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '17:00',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '20:00'),    
  NorthEastTrainList(
      trainNo: '342',trainType: 'ชานเมือง',departureStation: 'ชุมทางแก่งคอย',departureTime: '05:30',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '08:30'),  
  NorthEastTrainList(
      trainNo: '415',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '06:20',arriveStation: 'หนองคาย',arriveTime: '12:05'),    
  NorthEastTrainList(
      trainNo: '418',trainType: 'ท้องถิ่น',departureStation: 'หนองคาย',departureTime: '12:55',arriveStation: 'นครราชสีมา',arriveTime: '18:35'),
  NorthEastTrainList(
      trainNo: '417',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '15:55',arriveStation: 'อุดรธานี',arriveTime: '21:00'),    
  NorthEastTrainList(
      trainNo: '416',trainType: 'ท้องถิ่น',departureStation: 'อุดรธานี',departureTime: '05:55',arriveStation: 'นครราชสีมา',arriveTime: '10:55'),
  NorthEastTrainList(
      trainNo: '419',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '11:15',arriveStation: 'อุบลราชธานี',arriveTime: '16:45'),    
  NorthEastTrainList(
      trainNo: '420',trainType: 'ท้องถิ่น',departureStation: 'อุบลราชธานี',departureTime: '18:10',arriveStation: 'ลำชี',arriveTime: '21:10'),
  NorthEastTrainList(
      trainNo: '421',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '06:10',arriveStation: 'อุบลราชธานี',arriveTime: '12:15'),    
  NorthEastTrainList(
      trainNo: '422',trainType: 'ท้องถิ่น',departureStation: 'อุบลราชธานี',departureTime: '15:15',arriveStation: 'ลำชี',arriveTime: '18:15'),
  NorthEastTrainList(
      trainNo: '423',trainType: 'ท้องถิ่น',departureStation: 'ลำชึ',departureTime: '04:40',arriveStation: 'สำโรงทาบ',arriveTime: '05:40'),    
  NorthEastTrainList(
      trainNo: '424',trainType: 'ท้องถิ่น',departureStation: 'สำโรงทาบ',departureTime: '05:50',arriveStation: 'นครราชสีมา',arriveTime: '09:50'),
  NorthEastTrainList(
      trainNo: '425',trainType: 'ท้องถิ่น',departureStation: 'ลำชึ',departureTime: '05:30',arriveStation: 'อุบลราชธานี',arriveTime: '08:30'),    
  NorthEastTrainList(
      trainNo: '426',trainType: 'ท้องถิ่น',departureStation: 'อุบลราชธานี',departureTime: '12:30',arriveStation: 'นครราชสีมา',arriveTime: '18:25'),
  NorthEastTrainList(
      trainNo: '427',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '14:20',arriveStation: 'อุบลราชธานี',arriveTime: '20:15'),    
  NorthEastTrainList(
      trainNo: '428',trainType: 'ท้องถิ่น',departureStation: 'อุบลราชธานี',departureTime: '06:20',arriveStation: 'นครราชสีมา',arriveTime: '11:45'),
  NorthEastTrainList(
      trainNo: '429',trainType: 'ท้องถิ่น',departureStation: 'นครราชสีมา',departureTime: '17:55',arriveStation: 'ชุมทางบัวใหญ่',arriveTime: '19:25'),    
  NorthEastTrainList(
      trainNo: '430',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางบัวใหญ่',departureTime: '05:50',arriveStation: 'นครราชสีมา',arriveTime: '07:20'),
  NorthEastTrainList(
      trainNo: '431',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางแก่งคอย',departureTime: '05:00',arriveStation: 'ขอนแก่น',arriveTime: '11:30'),    
  NorthEastTrainList(
      trainNo: '432',trainType: 'ท้องถิ่น',departureStation: 'ขอนแก่น',departureTime: '14:30',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '20:30'),
  NorthEastTrainList(
      trainNo: '433',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางแก่งคอย',departureTime: '05:30',arriveStation: 'ชุมทางบัวใหญ่',arriveTime: '10:08'),    
  NorthEastTrainList(
      trainNo: '434',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางบัวใหญ่',departureTime: '12:20',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '17:10'),
  NorthEastTrainList(
      trainNo: '437',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางแก่งคอย',departureTime: '16:55',arriveStation: 'ลำนารายณ์',arriveTime: '18:26'),    
  NorthEastTrainList(
      trainNo: '438',trainType: 'ท้องถิ่น',departureStation: 'ลำนารายณ์',departureTime: '06:08',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '07:40'),
  NorthEastTrainList(
      trainNo: '439',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางแก่งคอย',departureTime: '11:45',arriveStation: 'ชุมทางบัวใหญ่',arriveTime: '16:40'),    
  NorthEastTrainList(
      trainNo: '440',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางบัวใหญ่',departureTime: '05:50',arriveStation: 'ชุมทางแก่งคอย',arriveTime: '10:40'),
  
];

class EastTrainList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขบวน
  String trainNo; //เลขขบวน
  String trainType; //ประเภทขบวน
  String departureStation; //สถานีต้นทาง
  String departureTime;
  String arriveStation; //สถานีปลายทาง
  String arriveTime;

  EastTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveTime,
    required this.arriveStation,
    required this.departureTime
  });
}

List<EastTrainList> eastTrainLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  EastTrainList(
      trainNo: '997',trainType: 'เร็ว',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '06:45',arriveStation: 'บ้านพลูตาหลวง',arriveTime: '09:50'),
  EastTrainList(
      trainNo: '998',trainType: 'เร็ว',departureStation: 'บ้านพลูตาหลวง',departureTime: '15:50',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '18:55'),
  EastTrainList(
      trainNo: '275',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '05:55',arriveStation: 'อรัญประเทศ',arriveTime: '11:11'),
  EastTrainList(
      trainNo: '276',trainType: 'ธรรมดา',departureStation: 'อรัญประเทศ',departureTime: '14:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '19:40'),
  EastTrainList(
      trainNo: '277',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '15:25',arriveStation: 'กบินทร์บุรี',arriveTime: '18:20'),
  EastTrainList(
      trainNo: '278',trainType: 'ธรรมดา',departureStation: 'กบินทร์บุรี',departureTime: '06:30',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '10:15'),
  EastTrainList(
      trainNo: '279',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '13:05',arriveStation: 'อรัญประเทศ',arriveTime: '17:21'),
  EastTrainList(
      trainNo: '280',trainType: 'ธรรมดา',departureStation: 'อรัญประเทศ',departureTime: '07:05',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '12:05'),
  EastTrainList(
      trainNo: '281',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '08:00',arriveStation: 'กบินทร์บุรี',arriveTime: '11:35'),
  EastTrainList(
      trainNo: '282',trainType: 'ธรรมดา',departureStation: 'กบินทร์บุรี',departureTime: '13:25',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '17:15'),
  EastTrainList(
      trainNo: '283',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '06:55',arriveStation: 'บ้านพลูตาหลวง',arriveTime: '11:20'),
  EastTrainList(
      trainNo: '284',trainType: 'ธรรมดา',departureStation: 'บ้านพลูตาหลวง',departureTime: '13:35',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '18:15'),
  EastTrainList(
      trainNo: '367',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '10:10',arriveStation: 'ชุมทางฉะเชิงเทรา',arriveTime: '11:45'),
  EastTrainList(
      trainNo: '368',trainType: 'ชานเมือง',departureStation: 'ชุมทางฉะเชิงเทรา',departureTime: '12:35',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '14:10'),
  EastTrainList(
      trainNo: '371',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '17:40',arriveStation: 'ปราจีนบุรี',arriveTime: '20:32'),
  EastTrainList(
      trainNo: '372',trainType: 'ชานเมือง',departureStation: 'ปราจีนบุรี',departureTime: '05:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '08:15'),
  EastTrainList(
      trainNo: '379',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '16:35',arriveStation: 'ชุมทางฉะเชิงเทรา',arriveTime: '18:05'),
  EastTrainList(
      trainNo: '380',trainType: 'ชานเมือง',departureStation: 'ชุมทางฉะเชิงเทรา',departureTime: '05:45',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '07:45'),
  EastTrainList(
      trainNo: '383',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '18:25',arriveStation: 'ชุมทางฉะเชิงเทรา',arriveTime: '20:00'),
  EastTrainList(
      trainNo: '384',trainType: 'ชานเมือง',departureStation: 'ชุมทางฉะเชิงเทรา',departureTime: '05:20',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '07:10'),
  EastTrainList(
      trainNo: '389',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '12:10',arriveStation: 'ชุมทางฉะเชิงเทรา',arriveTime: '13:30'),
  EastTrainList(
      trainNo: '390',trainType: 'ชานเมือง',departureStation: 'ชุมทางฉะเชิงเทรา',departureTime: '14:05',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '15:25'),
  EastTrainList(
      trainNo: '391',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '16:55',arriveStation: 'ชุมทางฉะเชิงเทรา',arriveTime: '18:25'),
  EastTrainList(
      trainNo: '388',trainType: 'ชานเมือง',departureStation: 'ชุมทางฉะเชิงเทรา',departureTime: '07:05',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '08:35'),
    
  
];

class SouthTrainList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขบวน
  String trainNo; //เลขขบวน
  String trainType; //ประเภทขบวน
  String departureStation; //สถานีต้นทาง
  String departureTime;
  String arriveStation; //สถานีปลายทาง
  String arriveTime;

  SouthTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveTime,
    required this.arriveStation,
    required this.departureTime
  });
}

List<SouthTrainList> southTrainLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  SouthTrainList(
      trainNo: '31',trainType: 'ด่วนพิเศษ CNR',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '14:50',arriveStation: 'ชุมทางหาดใหญ่',arriveTime: '07:25'),
  SouthTrainList(
      trainNo: '32',trainType: 'ด่วนพิเศษ CNR',departureStation: 'ชุมทางหาดใหญ่',departureTime: '17:45',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '10:50'),
  SouthTrainList(
      trainNo: '37',trainType: 'ด่วนพิเศษ',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '15:35',arriveStation: 'สุไหงโก-ลก',arriveTime: '12:30'),
  SouthTrainList(
      trainNo: '38',trainType: 'ด่วนพิเศษ',departureStation: 'สุไหงโก-ลก',departureTime: '14:20',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '12:05'),
  SouthTrainList(
      trainNo: '39',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '22:20',arriveStation: 'สุราษฎร์ธานี',arriveTime: '09:25'),
  SouthTrainList(
      trainNo: '40',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'สุราษฎร์ธานี',departureTime: '10:40',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '20:30'),
  SouthTrainList(
      trainNo: '43',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '08:10',arriveStation: 'สุราษฎร์ธานี',arriveTime: '18:50'),
  SouthTrainList(
      trainNo: '44',trainType: 'ด่วนพิเศษดีเซลราง',departureStation: 'สุราษฎร์ธานี',departureTime: '21:05',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '08:45'),
  SouthTrainList(
      trainNo: '45',trainType: 'ด่วนพิเศษ',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '15:35',arriveStation: 'ปาดังเบซาร์',arriveTime: '09:50'),
  SouthTrainList(
      trainNo: '46',trainType: 'ด่วนพิเศษ',departureStation: 'ปาดังเบซาร์',departureTime: '17:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '12:05'),
  SouthTrainList(
      trainNo: '83',trainType: 'ด่วน',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '17:30',arriveStation: 'ตรัง',arriveTime: '08:50'),
  SouthTrainList(
      trainNo: '84',trainType: 'ด่วน',departureStation: 'ตรัง',departureTime: '17:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '09:25'),
  SouthTrainList(
      trainNo: '85',trainType: 'ด่วน',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '20:10',arriveStation: 'นครศรีธรรมราช',arriveTime: '12:05'),
  SouthTrainList(
      trainNo: '86',trainType: 'ด่วน',departureStation: 'นครศรีธรรมราช',departureTime: '15:20',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '07:45'),
  SouthTrainList(
      trainNo: '167',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '18:50',arriveStation: 'กันตัง',arriveTime: '12:05'),
  SouthTrainList(
      trainNo: '168',trainType: 'เร็ว',departureStation: 'กันตัง',departureTime: '12:55',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '07:00'),
  SouthTrainList(
      trainNo: '169',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '16:10',arriveStation: 'ยะลา',arriveTime: '11:45'),
  SouthTrainList(
      trainNo: '170',trainType: 'เร็ว',departureStation: 'ยะลา',departureTime: '12:35',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '08:25'),
  SouthTrainList(
      trainNo: '171',trainType: 'เร็ว',departureStation: 'กรุงเทพอภิวัฒน์',departureTime: '13:10',arriveStation: 'สุไหงโก-ลก',arriveTime: '10:50'),
  SouthTrainList(
      trainNo: '172',trainType: 'เร็ว',departureStation: 'สุไหงโก-ลก',departureTime: '12:00',arriveStation: 'กรุงเทพอภิวัฒน์',arriveTime: '10:30'),
  SouthTrainList(
      trainNo: '251',trainType: 'ธรรมดา',departureStation: 'ธนบุรี',departureTime: '13:10',arriveStation: 'ประจวบคีรีขันธ์',arriveTime: '20:00'),
  SouthTrainList(
      trainNo: '252',trainType: 'ธรรมดา',departureStation: 'ประจวบคีรีขันธ์',departureTime: '04:50',arriveStation: 'ธนบุรี',arriveTime: '11:45'),
  SouthTrainList(
      trainNo: '255',trainType: 'ธรรมดา',departureStation: 'ธนบุรี',departureTime: '07:30',arriveStation: 'หลังสวน',arriveTime: '20:20'),
  SouthTrainList(
      trainNo: '254',trainType: 'ธรรมดา',departureStation: 'หลังสวน',departureTime: '06:20',arriveStation: 'ธนบุรี',arriveTime: '18:30'),
  SouthTrainList(
      trainNo: '257',trainType: 'ธรรมดา',departureStation: 'ธนบุรี',departureTime: '07:45',arriveStation: 'นํ้าตก',arriveTime: '12:35'),
  SouthTrainList(
      trainNo: '258',trainType: 'ธรรมดา',departureStation: 'นํ้าตก',departureTime: '12:55',arriveStation: 'ธนบุรี',arriveTime: '17:40'),
  SouthTrainList(
      trainNo: '259',trainType: 'ธรรมดา',departureStation: 'ธนบุรี',departureTime: '07:45',arriveStation: 'นํ้าตก',arriveTime: '12:35'),
  SouthTrainList(
      trainNo: '260',trainType: 'ธรรมดา',departureStation: 'นํ้าตก',departureTime: '05:20',arriveStation: 'ธนบุรี',arriveTime: '09:45'),
  SouthTrainList(
      trainNo: '261',trainType: 'ธรรมดา',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '09:20',arriveStation: 'หัวหิน',arriveTime: '14:15'),
  SouthTrainList(
      trainNo: '262',trainType: 'ธรรมดา',departureStation: 'หัวหิน',departureTime: '14:30',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '20:20'),
  SouthTrainList(
      trainNo: '351',trainType: 'ชานเมือง',departureStation: 'ธนบุรี',departureTime: '18:25',arriveStation: 'ราชบุรี',arriveTime: '20:35'),
  SouthTrainList(
      trainNo: '352',trainType: 'ชานเมือง',departureStation: 'ราชบุรี',departureTime: '04:45',arriveStation: 'ธนบุรี',arriveTime: '07:10'),
  SouthTrainList(
      trainNo: '355',trainType: 'ชานเมือง',departureStation: 'กรุงเทพ (หัวลำโพง)',departureTime: '16:40',arriveStation: 'สุพรรณบุรี',arriveTime: '20:05'),
  SouthTrainList(
      trainNo: '356',trainType: 'ชานเมือง',departureStation: 'สุพรรณบุรี',departureTime: '04:00',arriveStation: 'กรุงเทพ (หัวลำโพง)',arriveTime: '08:05'),    
  SouthTrainList(
      trainNo: '445',trainType: 'ท้องถิ่น',departureStation: 'ชุมพร',departureTime: '06:15',arriveStation: 'ชุมทางหาดใหญ่',arriveTime: '17:00'),
  SouthTrainList(
      trainNo: '446',trainType: 'ท้องถิ่น',departureStation: 'ชุมทางหาดใหญ่',departureTime: '06:35',arriveStation: 'ชุมพร',arriveTime: '17:05'),    
  SouthTrainList(
      trainNo: '447',trainType: 'ท้องถิ่น',departureStation: 'สุราษฎร์ธานี',departureTime: '06:20',arriveStation: 'สุไหงโกลก',arriveTime: '17:40'),
  SouthTrainList(
      trainNo: '448',trainType: 'ท้องถิ่น',departureStation: 'สุไหงโกลก',departureTime: '06:30',arriveStation: 'สุราษฎร์ธานี',arriveTime: '17:55'),   
  SouthTrainList(
      trainNo: '451',trainType: 'ท้องถิ่น',departureStation: 'นครศรีธรรมราช',departureTime: '06:00',arriveStation: 'สุไหงโกลก',arriveTime: '14:45'),
  SouthTrainList(
      trainNo: '452',trainType: 'ท้องถิ่น',departureStation: 'สุไหงโกลก',departureTime: '09:00',arriveStation: 'นครศรีธรรมราช',arriveTime: '17:50'),
  SouthTrainList(
      trainNo: '453',trainType: 'ท้องถิ่น',departureStation: 'ยะลา',departureTime: '06:30',arriveStation: 'สุไหงโกลก',arriveTime: '08:40'),
  SouthTrainList(
      trainNo: '454',trainType: 'ท้องถิ่น',departureStation: 'สุไหงโกลก',departureTime: '15:25',arriveStation: 'ยะลา',arriveTime: '17:35'), 
  SouthTrainList(
      trainNo: '455',trainType: 'ท้องถิ่น',departureStation: 'นครศรีธรรมราช',departureTime: '09:50',arriveStation: 'ยะลา',arriveTime: '16:30'),
  SouthTrainList(
      trainNo: '456',trainType: 'ท้องถิ่น',departureStation: 'ยะลา',departureTime: '06:35',arriveStation: 'นครศรีธรรมราช',arriveTime: '13:40'),  
  SouthTrainList(
      trainNo: '463',trainType: 'ท้องถิ่น',departureStation: 'พัทลุง',departureTime: '06:25',arriveStation: 'สุไหงโกลก',arriveTime: '12:45'),
  SouthTrainList(
      trainNo: '464',trainType: 'ท้องถิ่น',departureStation: 'สุไหงโกลก',departureTime: '12:55',arriveStation: 'พัทลุง',arriveTime: '18:25'),       
  SouthTrainList(
      trainNo: '485',trainType: 'ท้องถิ่น',departureStation: 'กาญจนบุรี',departureTime: '06:08',arriveStation: 'นํ้าตก',arriveTime: '08:20'),
  SouthTrainList(
      trainNo: '486',trainType: 'ท้องถิ่น',departureStation: 'นํ้าตก',departureTime: '15:30',arriveStation: 'กาญจนบุรี',arriveTime: '17:33'), 
  SouthTrainList(
      trainNo: '489',trainType: 'ท้องถิ่น',departureStation: 'สุราษฎร์ธานี',departureTime: '16:55',arriveStation: 'คีรีรัฐนิคม',arriveTime: '17:40'),
  SouthTrainList(
      trainNo: '490',trainType: 'ท้องถิ่น',departureStation: 'คีรีรัฐนิคม',departureTime: '06:15',arriveStation: 'สุราษฎร์ธานี',arriveTime: '07:00'), 
  SouthTrainList(
      trainNo: '947',trainType: 'ด่วนพิเศษ',departureStation: 'ชุมทางหาดใหญ่',departureTime: '07:40',arriveStation: 'ปาดังเบซาร์',arriveTime: '08:35'),
  SouthTrainList(
      trainNo: '948',trainType: 'ด่วนพิเศษ',departureStation: 'ปาดังเบซาร์',departureTime: '08:55',arriveStation: 'ชุมทางหาดใหญ่',arriveTime: '09:50'),
  SouthTrainList(
      trainNo: '949',trainType: 'ด่วนพิเศษ',departureStation: 'ชุมทางหาดใหญ่',departureTime: '14:00',arriveStation: 'ปาดังเบซาร์',arriveTime: '14:55'),
  SouthTrainList(
      trainNo: '950',trainType: 'ด่วนพิเศษ',departureStation: 'ปาดังเบซาร์',departureTime: '15:40',arriveStation: 'ชุมทางหาดใหญ่',arriveTime: '16:35'),
];