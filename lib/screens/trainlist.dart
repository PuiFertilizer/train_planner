import 'package:flutter/material.dart';
import 'package:train_planner/screens/traindetails.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/traindatalist.dart';

class Trainlist extends StatefulWidget {
  const Trainlist({Key? key}) : super(key: key);

  @override
  _TrainlistState createState() => _TrainlistState();
}

class _TrainlistState extends State<Trainlist> {
  List<String> linenames = ["สายเหนือ", "สายอีสาน", "สายตะวันออก", "สายใต้"];
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: linenames.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            drawer: NavBar(),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 87, 204, 153),
              title: Text('รายชื่อขบวนรถทุกสาย',style: GoogleFonts.prompt(color: Colors.black),),
            ),
            body: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/trainlist.jpg",
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: const Color.fromARGB(255, 87, 204, 153),
                  child: TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    labelStyle: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    tabs: const [
                      Tab(
                        text: 'เหนือ',
                      ),
                      Tab(
                        text: 'อีสาน',
                      ),
                      Tab(
                        text: 'ตะวันออก',
                      ),
                      Tab(
                        text: 'ใต้',
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: <Widget>[
                    DisplayTrain(trainListline: trainLists[0]),
                    DisplayTrain(trainListline: trainLists[1]),
                    DisplayTrain(trainListline: trainLists[2]),
                    DisplayTrain(trainListline: trainLists[3]),
                  ]),
                ),
              ],
            )),
      );
}

class DisplayTrain extends StatelessWidget {
  const DisplayTrain({super.key, required this.trainListline});
  final List<TrainList> trainListline;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 5, right: 18, bottom: 10),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 10,),
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
                              width: 70,
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
                const SizedBox(
                  height: 5,
                ),

                //เนื้อหาตารางใหม่
                SizedBox(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.45, //ขนาดหน้าจอ
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: RawScrollbar(
                        thumbColor: const Color.fromARGB(255, 132, 132, 132),
                        radius: const Radius.circular(20),
                        thickness: 5,
                        child: Container(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: trainListline.length,
                            itemBuilder: (BuildContext context, int index) {
                              TrainList trainList = trainListline[index];
                              return Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0.0, 0, 5.0),
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 199, 249, 204),
                                      // borderRadius:
                                      //     BorderRadius.circular(
                                      //         5.0),
                                    ),
                                    child: Row(children: [
                                      Container(
                                        width: 110,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TrainDetails(
                                                              train: trainList
                                                                  .trainNo)),
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ขบวน ${trainList.trainNo}', //เลขขบวน
                                                    style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    trainList
                                                        .trainType, //ประเภทขบวน
                                                    style: GoogleFonts.prompt(
                                                      color: Colors.black,
                                                      fontSize: 11.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Container(
                                        width: 215,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      trainList
                                                          .departureStation, //สถานีต้นทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      'ออก', //สถานีปลายทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      trainList
                                                          .departureTime, //สถานีต้นทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 13.0,
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
                                                      trainList
                                                          .arriveStation, //สถานีปลายทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      'ถึง', //สถานีปลายทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      trainList
                                                          .arriveTime, //สถานีปลายทางแต่ละขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 13.0,
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
                )

                //เนื้อหาตารางใหม่
              ],
            ),
          ),
        ],
      ),
    );
  }
}
