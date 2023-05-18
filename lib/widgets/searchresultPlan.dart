import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:train_planner/models/result_model.dart';
import 'package:train_planner/models/task.dart';
import 'package:train_planner/models/traindatalist.dart';
import 'package:train_planner/screens/traindetails.dart';
import 'package:train_planner/screens/stationdetails.dart';
import 'package:google_fonts/google_fonts.dart';
import '../db/db_helper.dart';
import 'package:intl/intl.dart';

// ผลการค้นหาเส้นทางตอนแก้ไขแผน เหมือนค้นหาจากหน้าแรก
class SearchresultPlan extends StatefulWidget {
  const SearchresultPlan(
      {Key? key,
      required this.source,
      required this.destination,
      required this.date,
      required this.planid})
      : super(key: key);
  final String source;
  final String destination;
  final String date;
  final int planid;

  @override
  // ignore: library_private_types_in_public_api
  _SearchresultPlanState createState() => _SearchresultPlanState();
}

class _SearchresultPlanState extends State<SearchresultPlan> {
  @override
  Widget build(BuildContext context) {
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
                                    icon: const Icon(Icons.filter),
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
                                  const SizedBox(width: 5.0),
                                  Text(
                                    '-',
                                    style: GoogleFonts.prompt(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
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
                            return resultCard(context, result);
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

  Stack resultCard(BuildContext context, Result result) {
    final df = DateFormat('dd/MM/yyyy');

    DateTime dateTime = DateTime.parse(widget.date);
    String dateText = df.format(dateTime);
    if (kDebugMode) {
      print(widget.date);
      print(dateTime);
      print(dateText);
    }
    bool checkIsOnlySatSun() =>
        dateTime.weekday >= 6 &&
        (isRunOnSatSun[1].contains(result.trainNumber));
    bool checkIsNotSatSun() =>
        dateTime.weekday >= 6 &&
        (isRunOnSatSun[0].contains(result.trainNumber));

    if (checkIsOnlySatSun() && dateTime.weekday <= 6) {
      return Stack();
    } else if (checkIsNotSatSun() && dateTime.weekday >= 6) {
      return Stack();
    }

    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
          height: 280.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 199, 249, 204),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //แบ่งครึ่งหน้า
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 87, 204, 153),
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.directions_train,
                                    size: 35.0,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StationDetails(
                                                    station:
                                                        result.departureStation,
                                                  )),
                                        );
                                      },
                                      child: Text(
                                        result.departureStation,
                                        style: GoogleFonts.prompt(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('เวลาออก  ',
                                            style: GoogleFonts.prompt(
                                              fontSize: 18.0,
                                            )),
                                        Text(result.departureTime,
                                            style: GoogleFonts.prompt(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
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
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 87, 204, 153),
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 35.0,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        //link ไปหน้ารายละเอียดของแต่ละสถานีในผลการค้นหา เช่น ลพบุรี ต้องแสดงของรายละเอียดของสถานีลพบุรี
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StationDetails(
                                                    station:
                                                        result.arriveStation,
                                                  )),
                                        );
                                      },
                                      child: Text(
                                        result.arriveStation,
                                        style: GoogleFonts.prompt(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('เวลาถึง  ',
                                            style: GoogleFonts.prompt(
                                              fontSize: 18.0,
                                              //fontWeight: FontWeight.w600,
                                            )),
                                        Text(result.arriveTime,
                                            style: GoogleFonts.prompt(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    result.traintype,
                                    style: GoogleFonts.prompt(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' ที่',
                                    style: GoogleFonts.prompt(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    result.trainNumber,
                                    style: GoogleFonts.prompt(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 100,
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrainDetails(
                                          train: result.trainNumber)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 10),
                                backgroundColor:
                                    const Color.fromARGB(255, 87, 204, 153),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "รายละเอียดขบวน",
                                style: GoogleFonts.prompt(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 12.0),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Task task = Task(
                                    planid: widget.planid,
                                    date: dateText,
                                    startTime: result.departureTime,
                                    endTime: result.arriveTime,
                                    attraction:
                                        "${result.departureStation} - ${result.arriveStation}",
                                    title:
                                        "โดยสารรถไฟขบวน ${result.trainNumber} ${result.traintype}");
                                DBHelper.insert(task);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 10),
                                backgroundColor:
                                    const Color.fromARGB(255, 87, 204, 153),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                "เพิ่มในแผน",
                                style: GoogleFonts.prompt(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14.0),
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
  }
}
