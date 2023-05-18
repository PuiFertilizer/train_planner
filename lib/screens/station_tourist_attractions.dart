//รายชื่อสถานที่สำคัญรอบสถานี
import 'package:flutter/material.dart';
import '../models/stationdatalist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'attractionsDetails.dart';

class StationTouristAttractions extends StatefulWidget {
  const StationTouristAttractions({Key? key, required this.station})
      : super(key: key);
  final StationList station;

  @override
  State<StationTouristAttractions> createState() =>
      _StationTouristAttractionsState();
}

class _StationTouristAttractionsState extends State<StationTouristAttractions> {
  @override
  Widget build(BuildContext context) {
    StationList station = widget.station;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 87, 204, 153),
          //title: Text('ผลการค้นหาเพิ่มในแผน', style: GoogleFonts.prompt(color: Colors.black),),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 15, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'สถานที่สำคัญโดยรอบสถานี',
                        style: GoogleFonts.prompt(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        //หัวใจรายการโปรด
                        children: const <Widget>[],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "สถานีรถไฟ",
                            style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            station
                                .name, //ชื่อสถานีตาม parameter ชื่อสถานีเดียวกับหน้ารายละเอียดสถานี
                            style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(
              child: Container(
                height: 400,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: RawScrollbar(
                    thumbColor: const Color.fromARGB(255, 34, 168, 1),
                    radius: const Radius.circular(20),
                    thickness: 5,
                    // color: Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: station.places.length,
                        itemBuilder: (BuildContext context, int index) {
                          var destination = station.places[index];
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AttractionsDetails(
                                          destination: destination)))
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 2.0, 0, 5.0),
                                  height: 50.0,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 2.0, 10.0, 0),
                                    child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              //แบ่งครึ่งหน้า
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center, //Center Row contents vertically,
                                              children: [
                                                SizedBox(
                                                  width: 300,
                                                  child: Text(
                                                    destination.locationName,
                                                    style: GoogleFonts.prompt(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ]),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
