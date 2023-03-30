import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:train_planner/widgets/addSearchResultNew.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';
import 'package:train_planner/screens/traindetails.dart';
import 'package:train_planner/screens/stationTouristAttractions.dart';

class StationDetails extends StatefulWidget {
  const StationDetails({Key? key, required this.station}) : super(key: key);
  final String station;
  @override
  _StationDetailsState createState() => _StationDetailsState();
}

class _StationDetailsState extends State<StationDetails> {
  //favourite
  bool _isFavourited = false;
  int _favouriteCount = 0;

  //change colors of favourite
  void _toggleFavourite() {
    setState(() {
      //สถานะรายการโปรด
      if (_isFavourited) {
        _favouriteCount -= 1;
        _isFavourited = false; //ไม่ชอบ
      } else {
        _favouriteCount += 1;
        _isFavourited = true; //ชอบ
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      Row(
                        children: [
                          Text(
                            'สถานีรถไฟ',
                            style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.station,
                            style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 22, // title ชื่อสถานีดึงตาม database
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //หัวใจรายการโปรด
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(0),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              alignment: Alignment.centerRight,
                              icon: (_isFavourited
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 40.0,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 40.0,
                                    )),
                              color: Colors.red[500],
                              //to call _toggleFavourite
                              onPressed: _toggleFavourite,
                            ),
                          )
                        ],
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
                            "ที่ตั้ง",
                            style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "ต.วัดเกต อ.เมืองเชียงใหม่ จ.เชียงใหม่", // ที่ตั้งสถานีดึงตาม database
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
            Container(
              height: 10,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
              height: 50,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(children: [
                  Text(
                    "กำหนดเวลาเดินรถ สถานี",
                    style: GoogleFonts.prompt(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget
                        .station, //ชื่อสถานีตาม parameter ชื่อสถานีของหน้านั้นๆ
                    style: GoogleFonts.prompt(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
            Container(
              height: 40,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Container(
                  color: const Color(0xff009889),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //Center Row contents vertically,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "ขบวน",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          "ต้นทาง",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "- ปลายทาง",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          "เวลา",
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Container(
              height: 4,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(
              child: Container(
                height: 320,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Container(
                    child: RawScrollbar(
                      thumbColor: const Color.fromARGB(255, 132, 132, 132),
                      radius: const Radius.circular(20),
                      thickness: 5,
                      // color: Color.fromARGB(255, 255, 255, 255),
                      child: Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: stationTrainLists.length,
                          itemBuilder: (BuildContext context, int index) {
                            StationTrainList stationTrainList =
                                stationTrainLists[index];
                            return Stack(
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0.0, 0, 4.0),
                                  height: 50.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 199, 249, 204),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 2.0, 10.0, 2.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              //แบ่งครึ่งหน้า
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center, //Center Row contents horizontally,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center, //Center Row contents vertically,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TrainDetails(
                                                                  train: stationTrainList
                                                                      .trainNo,
                                                                )),
                                                      );
                                                    },
                                                    child: Text(
                                                      stationTrainList
                                                          .trainNo, //เลขขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 20,
                                                ),
                                                //SizedBox(width: 5,),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 110,
                                                      child: Text(
                                                        stationTrainList
                                                            .originStation, //ชื่อสถานีต้นทางขบวน
                                                        style:
                                                            GoogleFonts.prompt(
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      child: Text(
                                                        stationTrainList
                                                            .destinationStation, //ชื่อสถานีปลายทางขบวน
                                                        style:
                                                            GoogleFonts.prompt(
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Container(
                                                  width: 50,
                                                ),

                                                Container(
                                                  width: 40,
                                                  child: Text(
                                                    stationTrainList
                                                        .stationTime, //เวลารถเข้า-ออก แต่ละสถานี
                                                    style: GoogleFonts.prompt(
                                                      color: Colors.black,
                                                      fontSize: 14.0,
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Container(
                  color: const Color(0xff009889),
                  height: 3,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox.fromSize(
                        size: const Size(80, 80),
                        child: Material(
                          color: const Color.fromARGB(255, 199, 249, 204),
                          child: InkWell(
                            //splashColor: Colors.green,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DialogMap();
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/map.png',
                                  width: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ), // <-- Icon
                                Text(
                                  "แผนที่",
                                  style: GoogleFonts.prompt(fontSize: 13),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(80, 80),
                        child: Material(
                          color: const Color.fromARGB(255, 199, 249, 204),
                          child: InkWell(
                            //splashColor: Colors.green,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DialogConnections();
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/walking.png',
                                  width: 25,
                                ),
                                const SizedBox(
                                  height: 5,
                                ), // <-- Icon
                                Text(
                                  "การเชื่อมต่อ",
                                  style: GoogleFonts.prompt(fontSize: 13),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(80, 80),
                        child: Material(
                          color: const Color.fromARGB(255, 199, 249, 204),
                          child: InkWell(
                            //splashColor: Colors.green,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DialogConvience();
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/amenities.png',
                                  width: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ), // <-- Icon
                                Text(
                                  "ความสะดวก",
                                  style: GoogleFonts.prompt(fontSize: 13),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(80, 80),
                        child: Material(
                          color: const Color.fromARGB(255, 199, 249, 204),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StationTouristAttractions()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/attractions.png',
                                  width: 40,
                                ),
                                const SizedBox(
                                  height: 5,
                                ), // <-- Icon
                                Text(
                                  "สถานที่",
                                  style: GoogleFonts.prompt(fontSize: 13),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}

class StationTrainList {
  String trainNo;
  String originStation;
  String destinationStation;
  String stationTime;

  StationTrainList({
    required this.trainNo,
    required this.originStation,
    required this.destinationStation,
    required this.stationTime,
  });
}

List<StationTrainList> stationTrainLists = [
  //รายชื่อขบวนที่จอดที่สถานีนี้พร้อมเวลา ดูตามชื่อสถานีและตารางจาก web scraping
  StationTrainList(
      trainNo: '109',
      originStation: 'กรุงเทพอภิวัฒน์',
      destinationStation: 'เชียงใหม่',
      stationTime: '04:05'),
  StationTrainList(
      trainNo: '102',
      originStation: 'เชียงใหม่',
      destinationStation: 'กรุงเทพอภิวัฒน์',
      stationTime: '06:30'),
  StationTrainList(
      trainNo: '9',
      originStation: 'กรุงเทพอภิวัฒน์',
      destinationStation: 'เชียงใหม่',
      stationTime: '07:15'),
  StationTrainList(
      trainNo: '13',
      originStation: 'กรุงเทพอภิวัฒน์',
      destinationStation: 'เชียงใหม่',
      stationTime: '08:40'),
  StationTrainList(
      trainNo: '8',
      originStation: 'เชียงใหม่',
      destinationStation: 'กรุงเทพอภิวัฒน์',
      stationTime: '08:50'),
  StationTrainList(
      trainNo: '408',
      originStation: 'เชียงใหม่',
      destinationStation: 'นครสวรรค์',
      stationTime: '09:20'),
  StationTrainList(
      trainNo: '51',
      originStation: 'กรุงเทพอภิวัฒน์',
      destinationStation: 'เชียงใหม่',
      stationTime: '12:10'),
  StationTrainList(
      trainNo: '407',
      originStation: 'นครสวรรค์',
      destinationStation: 'เชียงใหม่',
      stationTime: '14:35'),
  StationTrainList(
      trainNo: '52',
      originStation: 'เชียงใหม่',
      destinationStation: 'กรุงเทพอภิวัฒน์',
      stationTime: '15:30'),
  StationTrainList(
      trainNo: '14',
      originStation: 'เชียงใหม่',
      destinationStation: 'กรุงเทพอภิวัฒน์',
      stationTime: '17:00'),
  StationTrainList(
      trainNo: '10',
      originStation: 'เชียงใหม่',
      destinationStation: 'กรุงเทพอภิวัฒน์',
      stationTime: '18:00'),
  StationTrainList(
      trainNo: '7',
      originStation: 'กรุงเทพอภิวัฒน์',
      destinationStation: 'เชียงใหม่',
      stationTime: '19:30'),
];

class DialogConvience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'สิ่งอำนวยความสะดวกของสถานี',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่
                            Image.asset(
                              'assets/images/ticket.png',
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'จำหน่ายตั๋วล่วงหน้า',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่
                            Image.asset(
                              'assets/images/ticket.png',
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'จำหน่ายตั๋วประจำวัน',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่
                            Image.asset(
                              'assets/images/toliet.png',
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ห้องนำ้สะอาด',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่
                            Image.asset(
                              'assets/images/handicaptoliet.png',
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ห้องนำ้ผู้พิการ',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class DialogMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'แผนที่ของสถานี',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    //color: Colors.blue,
                    height: 240.0,
                    child: Container(
                      color: Colors.grey,
                    ))
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class DialogConnections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: 400,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'การเชื่อมต่อกับระบบขนส่งอื่นๆ',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่

                            Text(
                              'สถานีรถไฟใกล้เคียง',
                              style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Image.asset(
                              'assets/images/mrtblueline.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'สายสีนำ้เงิน สถานีบางซื่อ',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Image.asset(
                              'assets/images/darkredline.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'สายสีแดงเข้ม สถานีกรุงเทพอภิวัฒน์',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Image.asset(
                              'assets/images/lightredline.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'สายสีแดงอ่อน สถานีกรุงเทพอภิวัฒน์',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //ชื่อสถานที่

                            Text(
                              'รถโดยสาร',
                              style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Image.asset(
                              'assets/images/bus.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'รถสี่ล้อแดง ผู้โดยสารเลือกปลายทางได้',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Image.asset(
                              'assets/images/taxi.png',
                              width: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Taxi บริการที่หน้าสถานี',
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
