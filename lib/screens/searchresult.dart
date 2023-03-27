import 'package:flutter/material.dart';
import 'package:train_planner/models/result_model.dart';
//import 'package:train_planner/models/result_model.dart';
import 'package:train_planner/screens/traindetails.dart';
import 'package:train_planner/screens/stationdetails.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../db/db_helper.dart';

class Searchresult extends StatefulWidget {
  const Searchresult(
      {Key? key, required this.source, required this.destination})
      : super(key: key);
  //late Future<List<Map<Routes, Routes>>> result;
  final String source;
  final String destination;

  @override
  // ignore: library_private_types_in_public_api
  _SearchresultState createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    print(widget.source);
    print(widget.destination);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 87, 204, 153),
        ),
        body: FutureBuilder(
            future: DBHelper.seachR(widget.source, widget.destination),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Result> results = snapshot.data;
                print(snapshot.data);
                return Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'ผลการค้นหา',
                                style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.source,
                                    style: GoogleFonts.prompt(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '-',
                                    style: GoogleFonts.prompt(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    widget.destination,
                                    style: GoogleFonts.prompt(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: results.length,
                          itemBuilder: (BuildContext context, int index) {
                            Result result = results[index];
                            return Stack(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      20.0, 20.0, 20.0, 5.0),
                                  height: 280.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            //แบ่งครึ่งหน้า
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          87,
                                                                          204,
                                                                          153),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Icon(
                                                            Icons
                                                                .directions_train,
                                                            size: 35.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 20.0),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {
                                                                //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              StationDetails(
                                                                                station: result.departureStation,
                                                                              )),
                                                                );
                                                              },
                                                              child: Text(
                                                                result
                                                                    .departureStation,
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    'เวลาออก  ',
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      fontSize:
                                                                          18.0,
                                                                    )),
                                                                Text(
                                                                    result
                                                                        .departureTime,
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          87,
                                                                          204,
                                                                          153),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Icon(
                                                            Icons.location_on,
                                                            size: 35.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(width: 20.0),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {
                                                                //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา เช่น ลพบุรี ต้องแสดงของรายละเอียดของสถานีลพบุรี
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              StationDetails(
                                                                                station: result.arriveStation,
                                                                              )),
                                                                );
                                                              },
                                                              child: Text(
                                                                result
                                                                    .arriveStation,
                                                                style:
                                                                    GoogleFonts
                                                                        .prompt(
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    'เวลาถึง  ',
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      fontSize:
                                                                          18.0,
                                                                      //fontWeight: FontWeight.w600,
                                                                    )),
                                                                Text(
                                                                    result
                                                                        .arriveTime,
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              //ส่วนแบ่งครึ่งที่นี่
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 100,
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Text(
                                                            result.traintype,
                                                            style: GoogleFonts.prompt(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            'เลขที่',
                                                            style: GoogleFonts.prompt(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            result.trainNumber,
                                                            style: GoogleFonts.prompt(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'ชั้น 2',
                                                        style:
                                                            GoogleFonts.prompt(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        'รถนั่งปรับอากาศ',
                                                        style:
                                                            GoogleFonts.prompt(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                height: 100,
                                                width: 120,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        TrainDetails()),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize:
                                                              Size(120, 1),
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  87,
                                                                  204,
                                                                  153),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "รายละเอียดขบวน",
                                                          style: GoogleFonts
                                                              .prompt(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize:
                                                                      12.0),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Container(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          /*Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Searchresult()),
                                                  );*/
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize:
                                                              Size(120, 1),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  87,
                                                                  204,
                                                                  153),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "เพิ่มในแผน",
                                                          style: GoogleFonts
                                                              .prompt(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize:
                                                                      14.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  right: 40.0,
                                  top: 20.0,
                                  bottom: 10.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
