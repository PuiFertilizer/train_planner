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
              Tab(text: 'สายเหนือ',),
              Tab(text: 'สายอีสาน',),
              Tab(text: 'สายตะวันออก',),
              Tab(text: 'สายใต้',)
                      ],),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:10),
                child: TabBarView(children: [
                  Container( //tab ที่ 3
              
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
                height: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                            "ที่ตั้งสถานี ",
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
                                height: 375,
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
                                                      width: 330,
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
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              //       builder: (context) =>
                                                              //           TrainDetails(
                                                              //               train:
                                                              //                   eastTrainList.trainNo)),
                                                              // );
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text('สายอีสาน'),
                  Text('สายตะวันออก'),
                  Text('สายใต้'),

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
  

  NorthStationList({
    required this.stationName,
    required this.stationLocation,
    
  });
}

List<NorthStationList> northStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NorthStationList(
       stationName: 'กรุงเทพ',stationLocation: 'ปทุมวัน กรุงเทพฯ'),
  NorthStationList(
       stationName: 'สามเสน',stationLocation: 'ดุสิต กรุงเทพฯ'),
  NorthStationList(
       stationName: 'ชุมทางบางซื่อ',stationLocation: 'บางซื่อ กรุงเทพฯ'),
  NorthStationList(
       stationName: 'กรุงเทพอภิวัฒน์',stationLocation: 'บางซื่อ กรุงเทพฯ'),
  NorthStationList(
       stationName: 'ดอนเมือง',stationLocation: 'ดอนเมือง กรุงเทพฯ'),
  NorthStationList(
       stationName: 'รังสิต',stationLocation: 'ธัญบุรี ปทุมธานี'),
  NorthStationList(
       stationName: 'เชียงราก',stationLocation: 'คลองหลวง ปทุมธานี'),
  NorthStationList(
       stationName: 'บางปะอิน',stationLocation: 'บางปะอิน พระนครศรีอยุธยา'),
  NorthStationList(
       stationName: 'อยุธยา',stationLocation: 'พระนครศรีอยุธยา พระนครศรีอยุธยา'),
  NorthStationList(
       stationName: 'ชุมทางบ้านภาชี',stationLocation: 'ภาชี พระนครศรีอยุธยา'),
  
];
