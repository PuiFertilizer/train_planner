import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_planner/screens/stationdetails.dart';
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
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 87, 204, 153),
          title: Text('รายชื่อสถานี',style: GoogleFonts.prompt(color: Colors.black),),
        ),
        body: Column(
          
              children: <Widget>[
                
                Image.asset(
                  "assets/images/stationlistimage.jpg",
                  height: 110,
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
              Tab(text: 'เหนือ',),
              Tab(text: 'อีสาน',),
              Tab(text: 'ตะวันออก',),
              Tab(text: 'ใต้',)
                      ],),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: TabBarView(children: [
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
                            left: 5, top: 5, right: 5, bottom: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Container(
                height: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                  child: Container(
                    color: const Color(0xff009889),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Text(
                            " ชื่อสถานี",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          Text(
                            "ที่ตั้งสถานี (อำเภอ - จังหวัด)  ",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          
                          
                        ]),
                  ),
                ),
                          ),
                          SizedBox(height: 5,),
              
                            //เนื้อหาตารางใหม่
                            SizedBox(
                              child: Container(
                                height: context.mediaQuery.size.width*0.9,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
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
                                          itemCount: northStationLists.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            NorthStationList
                                                northStationList =
                                                northStationLists[index];
                                            return Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0.0, 0, 5.0),
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                          255, 199, 249, 204),
                                                    
                                                    // borderRadius:
                                                    //     BorderRadius.circular(
                                                    //         5.0),
                                                  ),
                                                  child: Row(children: [
                                                    Container(
                                                      width: context.mediaQuery.size.width*0.9,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0,
                                                                  ),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        StationDetails(
                                                                              station: northStationList.stationName,
                                                                            )),
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        northStationList.stationName, //เลขขบวน
                                                                        style: GoogleFonts.prompt(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w600),
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northStationList.transfer1),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northStationList.transfer2),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northStationList.transfer3),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  northStationList.stationLocation, //ประเภทขบวน
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
                    Text('สายตะวันออกเฉียงเหนือ (อีสาน)' ,style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 14.0,
                    ),),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, top: 5, right: 5, bottom: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Container(
                height: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                  child: Container(
                    color: const Color(0xff009889),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Text(
                            " ชื่อสถานี",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          Text(
                            "ที่ตั้งสถานี (อำเภอ - จังหวัด)  ",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          
                          
                        ]),
                  ),
                ),
                          ),
                          SizedBox(height: 5,),
              
                            //เนื้อหาตารางใหม่
                            SizedBox(
                              child: Container(
                                height: context.mediaQuery.size.width*0.9,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
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
                                          itemCount: northeastStationLists.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            NortheastStationList
                                                northeastStationList =
                                                northeastStationLists[index];
                                            return Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0.0, 0, 5.0),
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                          255, 199, 249, 204),
                                                    
                                                    // borderRadius:
                                                    //     BorderRadius.circular(
                                                    //         5.0),
                                                  ),
                                                  child: Row(children: [
                                                    Container(
                                                      width: context.mediaQuery.size.width*0.9,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0,
                                                                  ),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        StationDetails(
                                                                              station: northeastStationList.stationName,
                                                                            )),
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        northeastStationList.stationName, //เลขขบวน
                                                                        style: GoogleFonts.prompt(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w600),
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northeastStationList.transfer1),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northeastStationList.transfer2),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(northeastStationList.transfer3),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  northeastStationList.stationLocation, //ประเภทขบวน
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
                            left: 5, top: 5, right: 5, bottom: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Container(
                height: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                  child: Container(
                    color: const Color(0xff009889),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Text(
                            " ชื่อสถานี",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          Text(
                            "ที่ตั้งสถานี (อำเภอ - จังหวัด)  ",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          
                          
                        ]),
                  ),
                ),
                          ),
                          SizedBox(height: 5,),
              
                            //เนื้อหาตารางใหม่
                            SizedBox(
                              child: Container(
                                height: context.mediaQuery.size.width*0.9,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
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
                                          itemCount: eastStationLists.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            EastStationList
                                                eastStationList =
                                                eastStationLists[index];
                                            return Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0.0, 0, 5.0),
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                          255, 199, 249, 204),
                                                    
                                                    // borderRadius:
                                                    //     BorderRadius.circular(
                                                    //         5.0),
                                                  ),
                                                  child: Row(children: [
                                                    Container(
                                                      width: context.mediaQuery.size.width*0.9,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0,
                                                                  ),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        StationDetails(
                                                                              station: eastStationList.stationName,
                                                                            )),
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        eastStationList.stationName, //เลขขบวน
                                                                        style: GoogleFonts.prompt(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w600),
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(eastStationList.transfer1),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(eastStationList.transfer2),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(eastStationList.transfer3),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  eastStationList.stationLocation, //ประเภทขบวน
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
                            left: 5, top: 5, right: 5, bottom: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Container(
                height: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                  child: Container(
                    color: const Color(0xff009889),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          Text(
                            " ชื่อสถานี",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          Text(
                            "ที่ตั้งสถานี (อำเภอ - จังหวัด)  ",
                            style: GoogleFonts.prompt(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          
                          
                          
                        ]),
                  ),
                ),
                          ),
                          SizedBox(height: 5,),
              
                            //เนื้อหาตารางใหม่
                            SizedBox(
                              child: Container(
                                height: context.mediaQuery.size.width*0.9,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5),
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
                                          itemCount: southStationLists.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            SouthStationList
                                                southStationList =
                                                southStationLists[index];
                                            return Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0.0, 0, 5.0),
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                          255, 199, 249, 204),
                                                    
                                                    // borderRadius:
                                                    //     BorderRadius.circular(
                                                    //         5.0),
                                                  ),
                                                  child: Row(children: [
                                                    Container(
                                                      width: context.mediaQuery.size.width*0.9,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0,
                                                                  ),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        StationDetails(
                                                                              station: southStationList.stationName,
                                                                            )),
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        southStationList.stationName, //เลขขบวน
                                                                        style: GoogleFonts.prompt(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w600),
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(southStationList.transfer1),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(southStationList.transfer2),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                      SizedBox(width: 3,),
                                                                      Image(
                                                                          height: 21.0,                                                                     
                                                                          image: AssetImage(southStationList.transfer3),
                                                                          fit: BoxFit.cover,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  southStationList.stationLocation, //ประเภทขบวน
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

                ]),
              ),
            )
              ],
            
          ),
        
        
      ),
    );
  }

class NorthStationList { //ของสายเหนือ

  String stationName; 
  String stationLocation; 
  String transfer1;
  String transfer2;
  String transfer3;
  

  NorthStationList({
    required this.stationName,
    required this.stationLocation,
    required this.transfer1,
    required this.transfer2,
    required this.transfer3
  });
}

class NortheastStationList { //ของสายเหนือ

  String stationName; 
  String stationLocation; 
  String transfer1;
  String transfer2;
  String transfer3;
  

  NortheastStationList({
    required this.stationName,
    required this.stationLocation,
    required this.transfer1,
    required this.transfer2,
    required this.transfer3
  });
}

class EastStationList { //ของสายเหนือ

  String stationName; 
  String stationLocation; 
  String transfer1;
  String transfer2;
  String transfer3;
  

  EastStationList({
    required this.stationName,
    required this.stationLocation,
    required this.transfer1,
    required this.transfer2,
    required this.transfer3
  });
}

class SouthStationList { //ของสายเหนือ

  String stationName; 
  String stationLocation; 
  String transfer1;
  String transfer2;
  String transfer3;
  

  SouthStationList({
    required this.stationName,
    required this.stationLocation,
    required this.transfer1,
    required this.transfer2,
    required this.transfer3
  });
}

List<NorthStationList> northStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NorthStationList(
       stationName: 'กรุงเทพ',stationLocation: 'ปทุมวัน กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'สามเสน',stationLocation: 'ดุสิต กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ชุมทางบางซื่อ',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  NorthStationList(
       stationName: 'กรุงเทพอภิวัฒน์',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  NorthStationList(
       stationName: 'ดอนเมือง',stationLocation: 'ดอนเมือง กรุงเทพฯ',transfer1: 'assets/images/darkredline.png',transfer2: 'assets/images/local-airport.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'รังสิต',stationLocation: 'ธัญบุรี ปทุมธานี',transfer1: 'assets/images/darkredline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'เชียงราก',stationLocation: 'คลองหลวง ปทุมธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'บางปะอิน',stationLocation: 'บางปะอิน พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'อยุธยา',stationLocation: 'พระนครศรีอยุธยา พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ชุมทางบ้านภาชี',stationLocation: 'ภาชี พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'หนองวิวัฒน์',stationLocation: 'ท่าเรือ พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ท่าเรือ',stationLocation: 'ท่าเรือ พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'บ้านหมอ',stationLocation: 'บ้านหมอ สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'หนองโดน',stationLocation: 'หนองโดน สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านกลับ',stationLocation: 'หนองโดน สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านป่าหวาย',stationLocation: 'เมืองลพบุรี ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ลพบุรี',stationLocation: 'เมืองลพบุรี ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'โคกกะเทียม' ,stationLocation: 'เมืองลพบุรี ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านหมี่',stationLocation: 'บ้านหมี่ ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'จันเสน',stationLocation: 'ตาคลี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ช่องแค',stationLocation: 'ตาคลี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านตาคลี',stationLocation: 'ตาคลี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'หัวหวาย',stationLocation: 'ตาคลี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'หนองโพ',stationLocation: 'ตาคลี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'เนินมะกอก',stationLocation: 'พยุหะคีรี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'เขาทอง',stationLocation: 'พยุหะคีรี นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'นครสวรรค์',stationLocation: 'เมืองนครสวรรค์ นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ปากนํ้าโพ',stationLocation: 'เมืองนครสวรรค์ นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ทับกฤช',stationLocation: 'ชุมแสง นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ชุมแสง',stationLocation: 'ชุมแสง นครสวรรค์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บางมูลนาก',stationLocation: 'บางมูลนาก พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ตะพานหิน',stationLocation: 'ตะพานหิน พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'วังกรด',stationLocation: 'เมืองพิจิตร พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'พิจิตร',stationLocation: 'เมืองพิจิตร พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ท่าฬ่อ',stationLocation: 'เมืองพิจิตร พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บางกระทุ่ม',stationLocation: 'บางกระทุ่ม พิจิตร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านใหม่',stationLocation: 'เมืองพิษณุโลก พิษณุโลก',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'พิษณุโลก',stationLocation: 'เมืองพิษณุโลก พิษณุโลก',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'พรหมพิราม',stationLocation: 'พรหมพิราม พิษณุโลก',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'หนองตม',stationLocation: 'พรหมพิราม พิษณุโลก',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'พิชัย',stationLocation: 'พิชัย อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ชุมทางบ้านดารา',stationLocation: 'พิชัย อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ท่าสัก',stationLocation: 'พิชัย อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ตรอน',stationLocation: 'ตรอน อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'อุตรดิตถ์',stationLocation: 'เมืองอุตรดิตถ์ อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ศิลาอาสน์',stationLocation: 'เมืองอุตรดิตถ์ อุตรดิตถ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'เด่นชัย',stationLocation: 'เด่ยชัย แพร่',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'บ้านปิน',stationLocation: 'ลอง แพร่',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'แม่เมาะ',stationLocation: 'แม่เมาะ ลำปาง',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'นครลำปาง',stationLocation: 'เมืองลำปาง ลำปาง',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NorthStationList(
       stationName: 'ขุนตาน',stationLocation: 'แม่ทา ลำพูน',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'ลำพูน',stationLocation: 'เมืองลำพูน ลำพูน',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NorthStationList(
       stationName: 'เชียงใหม่',stationLocation: 'เมืองเชียงใหม่ เชียงใหม่',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
];

List<NortheastStationList> northeastStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NortheastStationList(
       stationName: 'กรุงเทพ',stationLocation: 'ปทุมวัน กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'สามเสน',stationLocation: 'ดุสิต กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ชุมทางบางซื่อ',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  NortheastStationList(
       stationName: 'กรุงเทพอภิวัฒน์',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  NortheastStationList(
       stationName: 'ดอนเมือง',stationLocation: 'ดอนเมือง กรุงเทพฯ',transfer1: 'assets/images/darkredline.png',transfer2: 'assets/images/local-airport.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'รังสิต',stationLocation: 'ธัญบุรี ปทุมธานี',transfer1: 'assets/images/darkredline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'เชียงราก',stationLocation: 'คลองหลวง ปทุมธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'บางปะอิน',stationLocation: 'บางปะอิน พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'อยุธยา',stationLocation: 'พระนครศรีอยุธยา พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ชุมทางบ้านภาชี',stationLocation: 'ภาชี พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'หนองกวย',stationLocation: 'ภาชี พระนครศรีอยุธยา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'สระบุรี',stationLocation: 'เมืองสระบุรี สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ชุมทางแก่งคอย',stationLocation: 'แก่งคอย สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'แก่งเสือเต้น',stationLocation: 'พัฒนานิคม ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ลำนารายณ์',stationLocation: 'ชัยบาดาล ลพบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'บำเหน็จณรงค์',stationLocation: 'บำเหน็จณรงค์ ชัยภูมิ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'จัตุรัส',stationLocation: 'จัตุรัส ชัยภูมิ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'บ้านเหลื่อม',stationLocation: 'บ้านเหลื่อม นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'มาบกะเบา',stationLocation: 'แก่งคอย สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'ผาเสด็จ',stationLocation: 'แก่งคอย สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'มวกเหล็ก',stationLocation: 'มวกเหล็ก สระบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ปากช่อง',stationLocation: 'ปากช่อง นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'สีคิ้ว',stationLocation: 'สีคิ้ว นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'สูงเนิน',stationLocation: 'สูงเนิน นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'กุดจิก',stationLocation: 'สูงเนิน นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'โคกกรวด',stationLocation: 'เมืองนครราชสีมา นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'นครราชสีมา',stationLocation: 'เมืองนครราชสีมา นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ชุมทางถนนจิระ',stationLocation: 'นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'จักราช',stationLocation: 'จักราช นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'ห้วยแถลง',stationLocation: 'ห้วยแถลง นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'ลำปลายมาศ',stationLocation: 'ลำปลายมาศ นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'บุรีรัมย์',stationLocation: 'เมืองบุรีรัมย์ บุรีรัมย์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'กระสัง',stationLocation: 'กระสัง บุรีรัมย์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'ลำชี',stationLocation: 'เมืองสุรินทร์ สุรินทร์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'สุรินทร์',stationLocation: 'เมืองสุรินทร์ สุรินทร์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ศีขรภูมิ',stationLocation: 'ศีขรภูมิ สุรินทร์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'สำโรงทาบ',stationLocation: 'ศีขรภูมิ สุรินทร์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'อุทุมพรพิสัย',stationLocation: 'อุทุมพรพิสัย ศรีสะเกษ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ศรีสะเกษ',stationLocation: 'เมืองศรีสะเกษ ศรีสะเกษ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'กันทรารมย์',stationLocation: 'กันทรารมย์ ศรีสะเกษ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'อุบลราชธานี',stationLocation: 'วารินชำราบ อุบลราชธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'โนนสูง',stationLocation: 'โนนสูง นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'เมืองคง',stationLocation: 'คง นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ชุมทางบัวใหญ่',stationLocation: 'บัวใหญ่ นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'หนองบัวลาย',stationLocation: 'บัวลาย นครราชสีมา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'เมืองพล',stationLocation: 'พล ขอนแก่น',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'บ้านไผ่',stationLocation: 'บ้านไฝ่ ขอนแก่น',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'ขอนแก่น',stationLocation: 'เมืองขอนแก่น ขอนแก่น',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'น้ำพอง',stationLocation: 'น้ำพอง ขอนแก่น',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'เขาสวนกวาง',stationLocation: 'เขาสวนกวาง ขอนแก่น',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'โนนสะอาด',stationLocation: 'โนนสะอาด อุดรธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'กุมภวาปี',stationLocation: 'กุมภวาปี อุดรธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       NortheastStationList(
       stationName: 'ห้วยสามพาด',stationLocation: 'ประจักษ์ศิลปาคม อุดรธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'อุดรธานี',stationLocation: 'เมืองอุดรธานี อุดรธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  NortheastStationList(
       stationName: 'หนองคาย',stationLocation: 'เมืองหนองคาย หนองคาย',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),


];

List<EastStationList> eastStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  EastStationList(
       stationName: 'กรุงเทพ',stationLocation: 'ปทุมวัน กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'อุรุพงษ์',stationLocation: 'ราชเทวี กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'พญาไท',stationLocation: 'ราชเทวี กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/bts.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'มักกะสัน',stationLocation: 'ราชเทวี กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'อโศก',stationLocation: 'ราชเทวี กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/mrtblueline.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'คลองตัน',stationLocation: 'ห้วยขวาง กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'สุขุมวิท 71',stationLocation: 'สวนหลวง กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'หัวหมาก',stationLocation: 'สวนหลวง กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านทับช้าง',stationLocation: 'สวนหลวง กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ซอยวัดลานบุญ',stationLocation: 'ประเวศ กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'ลาดกระบัง',stationLocation: 'ลาดกระบัง กรุงเทพฯ',transfer1: 'assets/images/Airlink.jpg',transfer2: 'assets/images/local-airport.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'พระจอมเกล้า',stationLocation: 'ลาดกระบัง กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'หัวตะเข้',stationLocation: 'ลาดกระบัง กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'คลองหลวงแพ่ง',stationLocation: 'ลาดกระบัง กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'คลองอุดมชลจร',stationLocation: 'เมืองฉะเชิงเทรา ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'เปรง',stationLocation: 'เมืองฉะเชิงเทรา ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'คลองแขวงกลั่น',stationLocation: 'เมืองฉะเชิงเทรา ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'คลองบางพระ',stationLocation: 'เมืองฉะเชิงเทรา ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บางเตย',stationLocation: 'เมืองฉะเชิงเทรา ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'ชุมทางฉะเชิงเทรา',stationLocation: 'เมืองฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บางน้ำเปรี้ยว',stationLocation: 'บางน้ำเปรี้ยว ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ชุมทางคลองสิบเก้า',stationLocation: 'ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'โยทะกา',stationLocation: 'บ้านสร้าง ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านสร้าง',stationLocation: 'บ้านสร้าง ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านปากพลี',stationLocation: 'ปากพลี นครนายก',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'ปราจีนบุรี',stationLocation: 'เมืองปราจีนบุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'โคกมะกอก',stationLocation: 'เมืองปราจีนบุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ประจันตคาม',stationLocation: 'ประจันตคาม ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านดงบัง',stationLocation: 'ประจันตคาม ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านพรหมแสง',stationLocation: 'กบินทร์บุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'กบินทร์บุรี',stationLocation: 'กบินทร์บุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'หนองสัง',stationLocation: 'กบินทร์บุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'พระปรง',stationLocation: 'กบินทร์บุรี ปราจีนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านแก้ง',stationLocation: 'เมืองสระแก้ว สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ศาลาลำดวน',stationLocation: 'เมืองสระแก้ว สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'สระแก้ว',stationLocation: 'เมืองสระแก้ว สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ท่าเกษม',stationLocation: 'เมืองสระแก้ว สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ห้วยโจด',stationLocation: 'วัฒนานคร สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'วัฒนานคร',stationLocation: 'วัฒนานคร สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ห้วยเดื่อ',stationLocation: 'วัฒนานคร สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'อรัญประเทศ',stationLocation: 'อรัญประเทศ สระแก้ว',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ดอนสีนนท์',stationLocation: 'บ้านโพธิ์ ฉะเชิงเทรา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'พานทอง',stationLocation: 'พานทอง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'ชลบุรี',stationLocation: 'เมืองชลบุรี ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บางพระ',stationLocation: 'ศรีราชา ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ชุมทางศรีราชา',stationLocation: 'ศรีราชา ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บางละมุง',stationLocation: 'บางละมุง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  EastStationList(
       stationName: 'พัทยา',stationLocation: 'บางละมุง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'พัทยาใต้',stationLocation: 'บางละมุง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ตลาดนํ้าสี่ภาค',stationLocation: 'บางละมุง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านห้วยขวาง',stationLocation: 'บางละมุง ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ญาณสังวราราม',stationLocation: 'สัตหีบ ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'สวนนงนุช',stationLocation: 'สัตหีบ ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'ชุมทางเขาชีจรรย์',stationLocation: 'สัตหีบ ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       EastStationList(
       stationName: 'บ้านพลูตาหลวง',stationLocation: 'สัตหีบ ชลบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       
  
];

List<SouthStationList> southStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  SouthStationList(
       stationName: 'กรุงเทพ',stationLocation: 'ปทุมวัน กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'สามเสน',stationLocation: 'ดุสิต กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ชุมทางบางซื่อ',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  SouthStationList(
       stationName: 'กรุงเทพอภิวัฒน์',stationLocation: 'บางซื่อ กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/darkredline.png',transfer3: 'assets/images/lightredline.png'),
  SouthStationList(
       stationName: 'บางบำหรุ',stationLocation: 'บางพลัด กรุงเทพฯ',transfer1: 'assets/images/lightredline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ธนบุรี',stationLocation: 'บางกอกน้อย กรุงเทพฯ',transfer1: 'assets/images/mrtblueline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ชุมทางตลิ่งชัน',stationLocation: 'ตลิ่งชัน กรุงเทพฯ',transfer1: 'assets/images/lightredline.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ศาลาธรรมสพน์',stationLocation: 'ทวีวัฒนา กรุงเทพฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ศาลายา',stationLocation: 'พุทธมณฑล นครปฐม',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'นครปฐม',stationLocation: 'เมืองนครปฐม นครปฐม',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ชุมทางหนองปลาดุก',stationLocation: 'บ้านโป่ง ราชบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'สุพรรณบุรี',stationLocation: 'เมืองสุพรรณบุรี สุพรรณบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'กาญจนบุรี',stationLocation: 'เมืองกาญจนบุรี กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'สะพานแควใหญ่',stationLocation: 'เมืองกาญจนบุรี กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ท่ากิเลน',stationLocation: 'ไทรโยค กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'สะพานถ้ำกระแซ',stationLocation: 'ไทรโยค กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'เกาะมหามงคล',stationLocation: 'ไทรโยค กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'น้ำตก',stationLocation: 'ไทรโยค กาญจนบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'บ้านโป่ง',stationLocation: 'บ้านโป่ง ราชบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'โพธาราม',stationLocation: 'โพธาราม ราชบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ราชบุรี',stationLocation: 'เมืองราชบุรี ราชบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ปากท่อ',stationLocation: 'ปากท่อ ราชบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'เพชรบุรี',stationLocation: 'เมืองเพชรบุรี เพชรบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ชะอำ',stationLocation: 'ชะอำ เพชรบุรี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'หัวหิน',stationLocation: 'หัวหิน ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'วังก์พง',stationLocation: 'ปราณบุรี ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ปราณบุรี',stationLocation: 'ปราณบุรี ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ประจวบคีรีขันธ์',stationLocation: 'เมืองประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ทับสะแก',stationLocation: 'ทับสะแก ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'บ้านกรูด',stationLocation: 'บางสะพาน ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'บางสะพานใหญ่',stationLocation: 'บางสะพาน ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'บางสะพานน้อย',stationLocation: 'บางสะพาน ประจวบคีรีขันธ์',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'มาบอำมฤต',stationLocation: 'ปะทิว ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ปะทิว',stationLocation: 'ปะทิว ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ชุมพร',stationLocation: 'เมืองชุมพร ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'สวี',stationLocation: 'สวี ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'หลังสวน',stationLocation: 'หลังสวน ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ละแม',stationLocation: 'ละแม ชุมพร',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ท่าชนะ',stationLocation: 'ท่าชนะ สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ไชยา',stationLocation: 'ไชยา สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'คีรีรัฐนิคม',stationLocation: 'คีรีรัฐนิคม สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'สุราษฎร์ธานี',stationLocation: 'พุนพิน สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'นาสาร',stationLocation: 'บ้านนาสาร สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'บ้านส้อง',stationLocation: 'เวียงสระ สุราษฎร์ธานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ฉวาง',stationLocation: 'ฉวาง นครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'คลองจันดี',stationLocation: 'ฉวาง นครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'นาบอน',stationLocation: 'นาบอน นครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ชุมทางทุ่งสง',stationLocation: 'ทุ่งสง นครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ตรัง',stationLocation: 'เมืองตรัง ตรัง',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'กันตัง',stationLocation: 'กันตัง ตรัง',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ชุมทางเขาชุมทอง',stationLocation: 'ร่อนพิบูลย์ นครศรีฯ',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'นครศรีธรรมราช',stationLocation: 'เมืองนครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ชะอวด',stationLocation: 'ชะอวด นครศรีธรรมราช',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'พัทลุง',stationLocation: 'เมืองพัทลุง พัทลุง',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ชุมทางหาดใหญ่',stationLocation: 'หาดใหญ่ สงขลา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ปาดังเบซาร์',stationLocation: 'รัฐปะลิส (ประเทศมาเลเซีย)',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ปัตตานี',stationLocation: 'โคกโพธิ์ ปัตตานี',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'ยะลา',stationLocation: 'เมืองยะลา ยะลา',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
       SouthStationList(
       stationName: 'ตันหยงมัส',stationLocation: 'ระแงะ นราธิวาส',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  SouthStationList(
       stationName: 'สุไหงโก,ลก',stationLocation: 'สุไหงโก-ลก นราธิวาส',transfer1: 'assets/images/notransfer.png',transfer2: 'assets/images/notransfer.png',transfer3: 'assets/images/notransfer.png'),
  
];