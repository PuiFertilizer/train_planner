import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_planner/screens/stationdetails.dart';
import 'package:train_planner/screens/traindetails.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: const Color.fromARGB(255, 87, 204, 153),
            title: Text("รายการโปรด",
                style: GoogleFonts.prompt(
                  color: Colors.black,
                )),
            bottom: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                indicatorWeight: 5,
                unselectedLabelColor: Colors.black,
                labelStyle: GoogleFonts.prompt(
                  color: Colors.black,
                  fontSize: 13,
                ),
                tabs: [
                  SizedBox(
                    height: 70.0,
                    child: Tab(
                      text: 'การเดินทาง',
                      icon: Image.asset(
                        'assets/images/route.png',
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                    child: Tab(
                      text: 'ขบวนรถ',
                      icon: Image.asset(
                        'assets/images/train1.png',
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                    child: Tab(
                      text: 'สถานี',
                      icon: Image.asset(
                        'assets/images/price.png',
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                    child: Tab(
                      text: 'สถานที่',
                      icon: Image.asset(
                        'assets/images/attractions.png',
                        width: 40,
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Container(
              //tab ที่ 1
              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18, top: 18, right: 18, bottom: 10),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 0,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),

                        //เนื้อหาตารางใหม่
                        SizedBox(
                          child: Container(
                            height: 510,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: RawScrollbar(
                                thumbColor:
                                    const Color.fromARGB(255, 132, 132, 132),
                                radius: const Radius.circular(20),
                                thickness: 5,
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: favouriteResults.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      FavouriteResult favouriteResult =
                                          favouriteResults[index];
                                      return Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0.0, 0, 10.0),
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 199, 249, 204),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Column(
                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      children: [
                                                        Row(children: [
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
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {
                                                                  //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            StationDetails(
                                                                              station: favouriteResult.departureStation,
                                                                            )), //ไปราะละเอียดแต่ละสถานี
                                                                  );
                                                                },
                                                                child: Text(
                                                                  favouriteResult
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
                                                                      favouriteResult
                                                                          .departureTime,
                                                                      style: GoogleFonts
                                                                          .prompt(
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      )),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(children: [
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
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {
                                                                  //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            StationDetails(
                                                                              station: favouriteResult.arriveStation,
                                                                            )), //ไปราะละเอียดแต่ละสถานี
                                                                  );
                                                                },
                                                                child: Text(
                                                                  favouriteResult
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
                                                                      )),
                                                                  Text(
                                                                      favouriteResult
                                                                          .arriveTime,
                                                                      style: GoogleFonts
                                                                          .prompt(
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      )),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                  ),

                                                  ///ลบ
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Container(
                                                      color: Colors.black,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                            height: 120,
                                                            width: 200,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      favouriteResult
                                                                          .traintype,
                                                                      style: GoogleFonts.prompt(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      ' ที่',
                                                                      style: GoogleFonts.prompt(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      favouriteResult
                                                                          .trainNumber,
                                                                      style: GoogleFonts.prompt(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  favouriteResult
                                                                      .classes,
                                                                  style:
                                                                      GoogleFonts
                                                                          .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  favouriteResult
                                                                      .coachtype1,
                                                                  style:
                                                                      GoogleFonts
                                                                          .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  favouriteResult
                                                                      .coachtype2,
                                                                  style:
                                                                      GoogleFonts
                                                                          .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return DialogDelete();
                                                                        }); //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                          height: 100,
                                                          width: 120,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            TrainDetails(
                                                                              train: favouriteResult.trainNumber,
                                                                            )),
                                                                  );
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  fixedSize:
                                                                      const Size(
                                                                          120,
                                                                          1),
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
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "รายละเอียดขบวน",
                                                                  style: GoogleFonts.prompt(
                                                                      color: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                      fontSize:
                                                                          12.0),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Container(
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {
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
                                                                        const Size(
                                                                            120,
                                                                            1),
                                                                    backgroundColor:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            87,
                                                                            204,
                                                                            153),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    "เพิ่มในแผน",
                                                                    style: GoogleFonts.prompt(
                                                                        color: const Color.fromARGB(
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
                        )

                        //เนื้อหาตารางใหม่
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //tab ที่ 2
              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 18, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 0,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 510,
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
                                        itemCount: favouriteTrainLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          FavouriteTrainList
                                              favouriteTrainList =
                                              favouriteTrainLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 10.0),
                                                height: 70.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 120,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 10),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      TrainDetails(
                                                                          train:
                                                                              favouriteTrainList.trainNo)),
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ขบวน ${favouriteTrainList.trainNo}', //เลขขบวน
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
                                                                favouriteTrainList
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
                                                    width: 170,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              favouriteTrainList
                                                                  .departureStation, //สถานีต้นทางแต่ละขบวน
                                                              style: GoogleFonts
                                                                  .prompt(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Text(
                                                              favouriteTrainList
                                                                  .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                              style: GoogleFonts
                                                                  .prompt(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return DialogDelete();
                                                            }); //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        size: 30,
                                                      ),
                                                    ),
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
            Container(
              //tab ที่ 3
              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 18, right: 18, bottom: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 0,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),

                          //เนื้อหาตารางใหม่
                          SizedBox(
                            child: Container(
                              height: 510,
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
                                        itemCount: favouriteStationLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          FavouriteStationList
                                              favouriteStationList =
                                              favouriteStationLists[index];
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0.0, 0, 10.0),
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    width: 290,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 10),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      StationDetails(
                                                                        station:
                                                                            favouriteStationList.stationName,
                                                                      )), //ไปราะละเอียดแต่ละสถานี
                                                            );
                                                          },
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                favouriteStationList
                                                                    .stationName, //ชื่อสถานี
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
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'จ. ${favouriteStationList.stationProvince}', //จังหวัดสถานี
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    favouriteStationList
                                                                        .stationRoute, //จังหวัดสถานี
                                                                    style: GoogleFonts
                                                                        .prompt(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return DialogDelete();
                                                            }); //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        size: 30,
                                                      ),
                                                    ),
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
            Container(
              //tab ที่ 4
              color: const Color.fromARGB(255, 255, 255, 255),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18, top: 18, right: 18, bottom: 10),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 0,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),

                        //เนื้อหาตารางใหม่
                        SizedBox(
                          child: Container(
                            height: 510,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Container(
                                child: RawScrollbar(
                                  thumbColor:
                                      const Color.fromARGB(255, 132, 132, 132),
                                  radius: const Radius.circular(20),
                                  thickness: 5,
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          favouriteAttractionLists.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        FavouriteAttractionList
                                            favouriteAttractionList =
                                            favouriteAttractionLists[index];
                                        return Stack(
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0.0, 0, 10.0),
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Row(children: [
                                                Container(
                                                  width: 290,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    StationDetails(
                                                                      station:
                                                                          favouriteAttractionList
                                                                              .attractionStation,
                                                                    )), //ไปราะละเอียดแต่ละสถานี
                                                          );
                                                        },
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              favouriteAttractionList
                                                                  .attractionName, //ชื่อสถานี
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
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'สถานีรถไฟ${favouriteAttractionList.attractionStation}', //จังหวัดสถานี
                                                                  style:
                                                                      GoogleFonts
                                                                          .prompt(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return DialogDelete();
                                                          }); //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      size: 30,
                                                    ),
                                                  ),
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
                ],
              ),
            ),
          ]),
        ),
      );
}

class FavouriteResult {
  String departureStation; //สถานีต้นทาง
  String departureTime; //เวลาออกต้นทาง
  String arriveStation; //สถานีปลายทาง
  String arriveTime; //เวลาถึงปลายทาง
  String traintype; //ประเภทขบวนรถ (เช่น ด่วนพิเศษ ด่วน เร็ว)
  String trainNumber; //เลขขบวนรถ
  String classes; //ชั้นที่นั่ง
  String coachtype1;
  String coachtype2;

  FavouriteResult({
    required this.departureStation,
    required this.departureTime,
    required this.arriveStation,
    required this.arriveTime,
    required this.traintype,
    required this.trainNumber,
    required this.classes,
    required this.coachtype1,
    required this.coachtype2,
  });
}

List<FavouriteResult> favouriteResults = [
  FavouriteResult(
      departureStation: 'กรุงเทพอภิวัฒน์',
      departureTime: '09:05',
      arriveStation: 'เชียงใหม่',
      arriveTime: '19:30',
      traintype: 'ด่วนพิเศษดีเซลราง',
      trainNumber: '7',
      classes: 'ชั้น 2',
      coachtype1: 'รถนั่งปรับอากาศ',
      coachtype2: ''),
  FavouriteResult(
      departureStation: 'เชียงใหม่',
      departureTime: '08:50',
      arriveStation: 'กรุงเทพอภิวัฒน์',
      arriveTime: '18:55',
      traintype: 'ด่วนพิเศษดีเซลราง',
      trainNumber: '8',
      classes: 'ชั้น 2',
      coachtype1: 'รถนั่งปรับอากาศ',
      coachtype2: ''),
  FavouriteResult(
      departureStation: 'หัวหิน',
      departureTime: '08:50',
      arriveStation: 'กรุงเทพ',
      arriveTime: '20:20',
      traintype: 'ธรรมดา',
      trainNumber: '262',
      classes: 'ชั้น 3',
      coachtype1: 'รถนั่งพัดลม',
      coachtype2: ''),
  FavouriteResult(
      departureStation: 'นครสวรรค์',
      departureTime: '05:00',
      arriveStation: 'เชียงใหม่',
      arriveTime: '14:35',
      traintype: 'ท้องถิ่น',
      trainNumber: '407',
      classes: 'ชั้น 3',
      coachtype1: 'รถนั่งพัดลม',
      coachtype2: ''),
];

class FavouriteTrainList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขบวน
  String trainNo; //เลขขบวน
  String trainType; //ประเภทขบวน
  String departureStation; //สถานีต้นทาง
  String arriveStation; //สถานีปลายทาง

  FavouriteTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveStation,
  });
}

List<FavouriteTrainList> favouriteTrainLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  FavouriteTrainList(
      trainNo: '7',
      trainType: 'ด่วนพิเศษดีเซลราง',
      departureStation: 'กรุงเทพอภิวัฒน์',
      arriveStation: 'เชียงใหม่'),
  FavouriteTrainList(
      trainNo: '8',
      trainType: 'ด่วนพิเศษดีเซลราง',
      departureStation: 'เชียงใหม่',
      arriveStation: 'กรุงเทพอภิวัฒน์'),
  FavouriteTrainList(
      trainNo: '31',
      trainType: 'ด่วนพิเศษ CNR',
      departureStation: 'กรุงเทพอภิวัฒน์',
      arriveStation: 'ชุมทางหาดใหญ่'),
  FavouriteTrainList(
      trainNo: '32',
      trainType: 'ด่วนพิเศษ CNR',
      departureStation: 'ชุมทางหาดใหญ่',
      arriveStation: 'กรุงเทพอภิวัฒน์'),
];

class FavouriteStationList {
  //**ข้อมูลมาจากหน้ารายละเอียดของแต่ละขสถานี
  String stationName; //ชื่อสถานี
  String stationProvince; //จังหวัดสถานี
  String stationRoute; //เส้นทางสถานี เช่น เหนือ ใต้

  FavouriteStationList({
    required this.stationName,
    required this.stationProvince,
    required this.stationRoute,
  });
}

List<FavouriteStationList> favouriteStationLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  FavouriteStationList(
      stationName: 'อรัญประเทศ',
      stationProvince: 'สระแก้ว',
      stationRoute: 'สายตะวันออก'),
  FavouriteStationList(
      stationName: 'กรุงเทพอภิวัฒน์',
      stationProvince: 'กรุงเทพฯ',
      stationRoute: 'สายเหนือ'),
  FavouriteStationList(
      stationName: 'เชียงใหม่',
      stationProvince: 'เชียงใหม่',
      stationRoute: 'สายเหนือ'),
  FavouriteStationList(
      stationName: 'หัวหมาก',
      stationProvince: 'กรุงเทพฯ',
      stationRoute: 'สายตะวันออก'),
  FavouriteStationList(
      stationName: 'ศิลาอาสน์',
      stationProvince: 'อุตรดิตถ์',
      stationRoute: 'สายเหนือ'),
];

class FavouriteAttractionList {
  //**ข้อมูลมาจากหน้ารายละเอียดของสถานที่ท่องเที่ยวว่าชื่ออะไร อยู่ใกล้สถานีอะไร
  String attractionName; //ชื่อสถานที่ท่องเที่ยว
  String attractionStation; //จังหวัดสถานที่ท่องเที่ยว

  FavouriteAttractionList({
    required this.attractionName,
    required this.attractionStation,
  });
}

List<FavouriteAttractionList> favouriteAttractionLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  FavouriteAttractionList(
      attractionName: 'วัดโสธรวรารามวรวิหาร',
      attractionStation: 'ชุมทางฉะเชิงเทรา'),
  FavouriteAttractionList(
      attractionName: 'สะพานข้ามแม่นำ้แคว', attractionStation: 'สะพานแควใหญ่'),
  FavouriteAttractionList(
      attractionName: 'นำ้ตกไทรโยคน้อย', attractionStation: 'นำ้ตก'),
];

class DialogDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
            height: 110,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'ต้องการลบจากรายการโปรดหรือไม่',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          //ไม่ลบ
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                        ),
                        child: Text(
                          'ใช่',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //ไม่ลบ
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 56, 163, 165),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                        ),
                        child: Text(
                          'ไม่ใช่',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
