import 'package:flutter/material.dart';
import 'package:train_planner/models/stationdatalist.dart';
import 'package:google_fonts/google_fonts.dart';
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
    StationList stationdetail;
    int stindex =
        stationLists.indexWhere((element) => element.name == widget.station);
    if (stindex >= 0) {
      stationdetail = stationLists[stindex];
    } else {
      stationdetail = StationList(
          name: '',
          postition: '',
          places: [],
          connects: [],
          comforts: [],
          lines: []);
    }
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
                            width: 5,
                          ),
                          Text(
                            stationdetail
                                .postition, // ที่ตั้งสถานีดึงตาม database
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
              height: MediaQuery.of(context).size.height * 0.07,
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
                height: MediaQuery.of(context).size.height * 0.35,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
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
                                  color:
                                      const Color.fromARGB(255, 199, 249, 204),
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
                                              SizedBox(
                                                width: 50,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    //link ไปหน้ารายละเอียดของแต่ละเลขขบวนได้ตาม index
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TrainDetails(
                                                                train:
                                                                    stationTrainList
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
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      stationTrainList
                                                          .originStation, //ชื่อสถานีต้นทางขบวน
                                                      style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      stationTrainList
                                                          .destinationStation, //ชื่อสถานีปลายทางขบวน
                                                      style: GoogleFonts.prompt(
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

                                              SizedBox(
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
                                    return DialogConnections(
                                      connect: stationdetail.connects,
                                    );
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
                                    return DialogConvience(
                                      convience: stationdetail.comforts,
                                    );
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
                                        StationTouristAttractions(
                                          station: stationdetail,
                                        )),
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
  const DialogConvience({super.key, required this.convience});
  final List<String> convience;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('สิ่งอำนวยความสะดวก'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        children: <Widget>[
          SizedBox(
              height: 400,
              width: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: convience.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //ชื่อประเภท
                          Image.asset(
                            comfortPic[convience[index]]!,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            convience[index],
                            style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  }))
        ]);
  }
}

class DialogMap extends StatelessWidget {
  const DialogMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
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
                SizedBox(
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
  const DialogConnections({super.key, required this.connect});
  final List<String> connect;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('การเชื่อมต่อกับระบบขนส่งอื่นๆ'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        children: <Widget>[
          SizedBox(
              height: 400,
              width: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: connect.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //ชื่อประเภท
                          Image.asset(
                            connectPic[connect[index]]!,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            connect[index],
                            style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  }))
        ]);
  }
}
