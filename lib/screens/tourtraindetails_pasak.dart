import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_planner/screens/stationdetails.dart';

import '../widgets/Destination_Carousel.dart';

class Tourtraindetails_Pasak extends StatefulWidget {
  const Tourtraindetails_Pasak({Key? key}) : super(key: key);

  @override
  _Tourtraindetails_PasakState createState() => _Tourtraindetails_PasakState();
}

class _Tourtraindetails_PasakState extends State<Tourtraindetails_Pasak> {


  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        indicatorWeight: 7,
        unselectedLabelColor: Colors.black,
        labelStyle: GoogleFonts.prompt(
          color: Colors.black,
          fontSize: 17,
        ),
        tabs: [
          SizedBox(
            height: 80.0,
            child: Tab(
              text: 'โปรแกรม',
              icon: Image.asset(
                'assets/images/route.png',
                width: 35,
              ),
            ),
          ),
          SizedBox(
            height: 80.0,
            child: Tab(
              text: 'สถานี',
              icon: Image.asset(
                'assets/images/clock.png',
                width: 35,
              ),
            ),
          ),
          SizedBox(
            height: 80.0,
            child: Tab(
              text: 'ขบวนรถ',
              icon: Image.asset(
                'assets/images/train1.png',
                width: 35,
              ),
            ),
          ),
          SizedBox(
            height: 80.0,
            child: Tab(
              text: 'ราคา',
              icon: Image.asset(
                'assets/images/price.png',
                width: 35,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'รถไฟนำเที่ยว เขื่อนป่าสักชลสิทธิ์',
                  style: GoogleFonts.prompt(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "\n"),
                
                TextSpan(
                    text: 'มีทุกวันหยุด เฉพาะเดือน พ.ย. ถึง ม.ค.',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 17,
                    )),
              ]),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          //title: Text('AppBar'),

          bottom: PreferredSize(
              preferredSize: const Size(200.0, 100.0),
              child: Column(
                children: [
                  Material(
                    elevation: 18.0,
                    color: const Color.fromARGB(255, 138, 237, 153),
                    child: Theme(
                        //<-- SEE HERE
                        data: ThemeData().copyWith(splashColor: Colors.white),
                        child: _tabBar),
                  ),
                ],
              )),
        ),
          body: TabBarView(
            children: [
             SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                    height: 40,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                  //ชื่อสถานที่
                          Text(
                            'รายละเอียดโปรแกรมท่องเที่ยว',
                          style: GoogleFonts.prompt(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                  
                ],
                          ),
                        ),
                      ),
                      Padding(
                       padding: const EdgeInsets.only(left: 20, right: 20),
                       child: Container(
                         height: 5,
                         color: const Color.fromARGB(255, 128, 237, 153),
                       ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                      height: 40,

                      child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'ขบวนรถพิเศษนำเที่ยวที่ 921/926',
                          style: GoogleFonts.prompt(
                          color: Colors.black,
                          fontSize: 16,
                          
                        ),
                        ),
                  
                ],
                          ),
                        ),
                    ),
                    SizedBox(
                        height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '06:00 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153), fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ขบวนรถไฟพิเศษนำเที่ยวเขื่อนป่าสักชลสิทธิ์ออกจากสถานีกรุงเทพ (หัวลำโพง)',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '09:00 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153), fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ออกจากสถานีนถไฟหินซ้อนแล้ว จะพบทุ่งทานตะวันริมทางรถไฟสีเหลืองงดงานตลอดแนว',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '09:20 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ถึงที่หยุดรถเขื่อนป่าสักชลสิทธิ',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '09.25 - 09.55 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ขบวนรถหยุด ณ จุดชมวิวประมาณ 30 นาที ให้นักท่องเที่ยวชมทิวทัศน์ ถ่ายภาพบริเวณ เหนือเขื่อนป่าสักชลสิทธิ์ ชม “รถไฟลอยนํ้า” ',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '10:00 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ถึงสถานีโคกสลุง',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '10:35 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ขบวนรถถึงที่หยุดรถเขื่อนป่าสักชลสิทธิ์ รับประทานอาหารกลางวันตามอัธยาศัย หรือจะใช้บริการของรถไฟเล็กพาชมความตื่นตาตื่นใจของวิวทิวทัศน์รอบๆ จนอิ่มอกอิ่มใจ และซื้อของฝาก ของที่ระลึก ผลิตภัณฑ์ชุมชนก็ได้',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '15:30 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ขบวนรถไฟพิเศษนำเที่ยว ออกจากที่หยุดรถเขื่อนป่าสักชลสิทธิ์',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              '18:50 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
                            ),
                            ],
                           ),
                          ),
                        ),
                        Container(  
                          child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              'ถึงสถานีกรุงเทพ (หัวลำโพง)', maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
                            ),
                            ],
                           ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                        height: 15,
                    ),
                    Namtok_Carousel(),
                    
                      

                  ],
              
                ),
              ),
              Container(
      color: const Color.fromARGB(255, 255, 255, 255),

      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, top: 18, right: 18, bottom: 10),
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
                                .start, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, //Center Row contents vertically,
                            children: [
                              Container(
                                width: 220,
                                alignment: Alignment.center,
                                child: Text(
                                  "สถานีที่จอด",
                                  style: GoogleFonts.prompt(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: 2,
                              ),
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                child: Text(
                                  "เวลา",
                                  style: GoogleFonts.prompt(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
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
                  //เนื้อหาตารางใหม่
                  SizedBox(
                    child: Container(
                      height: 400,
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
                              itemCount: pasakStationStopLists.length,
                              itemBuilder: (BuildContext context, int index) {
                                PasakStationStopList pasakStationStopList =
                                    pasakStationStopLists[index];
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.0, 0, 2.0),
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 199, 249, 204),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start, //Center Row contents horizontally,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center, //Center Row contents vertically,
                                          children: [
                                            Container(
                                              width: 220,
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StationDetails(
                                                              station:
                                                                  pasakStationStopList
                                                                      .stationName,
                                                            )),
                                                  );
                                                },
                                                child: Text(
                                                  pasakStationStopList.stationName,
                                                  style: GoogleFonts.prompt(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            Container(
                                              width: 100,
                                              alignment: Alignment.center,
                                              child: Text(
                                                pasakStationStopList.time,
                                                style: GoogleFonts.prompt(
                                                  color: Colors.black,
                                                  fontSize: 14.0,
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
                  )

                  //เนื้อหาตารางใหม่
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          
        ],
      ),
    ),
              Container(
      //tab ที่ 2
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 199, 249, 204),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'ผังขบวนรถภาพรวม', //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis, // new
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //ผังขบวนรถซึ่งแต่ละขบวนจะไม่เหมือนกัน สามารถเลื่อนซ้ายขวาได้
                                 Image.asset(
                                   'assets/images/trainchart/trainchart_921_926.png',
                                    height: 45,
                                ) //ผังขบวนรถตามเลขขบวน
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_back_sharp,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 20,
                                    ),
                                     Text(
                                     'เขื่อนป่าสัก', //ชื่อสถานีปลายทางของแต่ละขบวน
                                      style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                    fontSize: 12,
                                  )),
                                ),

                                  ],
                                ),
                                
                               
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'กรุงเทพ', //ชื่อสถานีปลายทางของแต่ละขบวน
                                      style: GoogleFonts.prompt(
                                          textStyle: const TextStyle(
                                        fontSize: 12,
                                      )),
                                    ),
                                    const SizedBox(
                                  width: 2,
                                ),
                                const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 20,
                                ),
                                  ],
                                ),
                                
                                
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: RawScrollbar(
                  thumbColor: const Color.fromARGB(255, 130, 130, 130),
                  radius: const Radius.circular(20),
                  thickness: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: pasakSeatings.length,
                      itemBuilder: (BuildContext context, int index) {
                        PasakSeating pasakSeating = pasakSeatings[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 5.0),
                              height: 508,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                           pasakSeating.coachname, //ชื่อของตู้โดยสาร
                                            style: GoogleFonts.prompt(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            softWrap: false,
                                            maxLines: 3,
                                            overflow:
                                                TextOverflow.ellipsis, // new
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            height: 120.0,
                                            width: 135.0, //200
                                            image: AssetImage(
                                                pasakSeating.imageUrlExterior),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image(
                                            height: 120.0,
                                            width: 135.0, //200
                                            image: AssetImage(
                                                pasakSeating.imageUrlInterior),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(pasakSeating.description,
                                        style: GoogleFonts.prompt(
                                            fontSize: 14, color: Colors.black)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('ผังที่นั่ง',
                                        style: GoogleFonts.prompt(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_back_sharp,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    "เขื่อนป่าสัก",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red)),
                                                  ),
                                                  const SizedBox(
                                                    width: 80,
                                                  ),
                                                  Text(
                                                    "กรุงเทพ",
                                                    style: GoogleFonts.prompt(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        4,
                                                                        0,
                                                                        226))),
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_forward_sharp,
                                                    color: Color.fromARGB(
                                                        255, 4, 0, 226),
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image(
                                                          height: 110.0,
                                                          //width: 200.0, //200
                                                          image: AssetImage(pasakSeating
                                                              .imageUrlSeatchart),
                                                          fit: BoxFit.cover,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text('สิ่งอำนวยความสะดวก',
                                        style: GoogleFonts.prompt(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    //SizedBox(height: 5,),
                                    Image(
                                      height: 40.0,
                                      //width: 200.0, //200
                                      image:
                                          AssetImage(pasakSeating.imageUrlConvience),
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
              Container(
      //tab ที่ 3
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: RawScrollbar(
                  thumbColor: const Color.fromARGB(255, 130, 130, 130),
                  radius: const Radius.circular(20),
                  thickness: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: pasakfare.length,
                      itemBuilder: (BuildContext context, int index) {
                        PasakFare pasakfares = pasakfare[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 5.0),
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            pasakfares.coachname, //ชื่อของตู้โดยสาร
                                            style: GoogleFonts.prompt(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            softWrap: false,
                                            maxLines: 3,
                                            overflow:
                                                TextOverflow.ellipsis, // new
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          pasakfares.seattype, //ประเภทที่นั่ง
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ),
                                        Text(
                                          pasakfares.price, //ราคาค่าโดยสาร
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 4, 0, 226))),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      pasakfares.notes, //ประเภทที่นั่ง
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    )
            ]),
      ),
  );
}

class Namtok_Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'แหล่งท่องเที่ยวสำคัญของทริปนี้',
                style: GoogleFonts.prompt(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ]),
        
        ),
        Container(
          //color: Colors.blue,
          height: 240.0,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pasakdestinations.length,
          itemBuilder: (BuildContext context, int index) {
            PasakDestination destination = pasakdestinations[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 210.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  bottom: 15.0,
                child: Container(
                  height: 205.0,
                  width: 200.0,
                  decoration: BoxDecoration( //ทำเงาดำ
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 10.0,
                      ),
                    ]
                  ),

                  //Padding
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(destination.city,
                             style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                              )),
                      Text(destination.description,
                      style: GoogleFonts.prompt(
                        color: Color.fromARGB(255, 80, 80, 80),
                        fontSize: 12.0,
                      ),),
                    ],
                  ),
                )

                ),
            ),

                Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            height: 140.0, 
                            width: 200.0, //200
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column( //wra[]
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            
                          Row(
                            children: <Widget>[
                            SizedBox(width: 4.0,),
                            
                            ],
                            ),
                          ],),
                        )
                      ],
                    ),
                )

              ],
            ),
          );
            },
          ),
        
        )
      ]
    );
  }
}

class PasakDestination {
  String imageUrl;
  String city;
  String description;


  PasakDestination({
    required this.imageUrl,
    required this.city,
    required this.description,
  });
}



List<PasakDestination> pasakdestinations = [
  PasakDestination(
    imageUrl: 'assets/images/sunflower.jpg',
    city: 'ทุ่งทางตะวัน',
    description: 'หลังออกจากสถานีหินซ้อน',
  ),
  PasakDestination(
    imageUrl: 'assets/images/pasak1.jpg',
    city: 'จุดชมวิวรถไฟลอยนํ้า',
    description: 'เหนือเขื่อนป่าสัก 10:11 - 10:41',
  ),
  PasakDestination(
    imageUrl: 'assets/images/pasak3.jpg',
    city: 'ที่หยุดรถของเขื่อน',
    description: 'ที่หยุดรถเขื่อนป่าสักฯ 11:32',

  ),
  PasakDestination(
    imageUrl: 'assets/images/pasak2.jpg',
    city: 'ประตูสันเขื่อนป่าสัก',
    description: '11:32 - 15:30',

  ),
  PasakDestination(
    imageUrl: 'assets/images/pasak4.jpg',
    city: 'รถไฟเล็กชมสันเขื่อน',
    description: '11:32 - 15:30',

  ),

 
];

class PasakSeating {
  //รายละเอียดขบวน (ที่นั่ง ชนิดรถ รูปรถภายนอกภายใน) แต่ละขบวนอาจมีมากกว่า 2 ชนิดได้
  String imageUrlExterior; //รูปภายนอกรถ
  String imageUrlInterior; //รูปภายในรถ
  String imageUrlSeatchart; //รูปผังที่นั่ง
  String coachname; //ชื่อชนิดรถ
  String description; //คำอธิบายเพิ่มเติม (เช่น ไม่มีบริการอาหาร)
  String imageUrlConvience; //รูป icon ความสะดวก

  PasakSeating({
    required this.imageUrlExterior,
    required this.imageUrlInterior,
    required this.imageUrlSeatchart,
    required this.coachname,
    required this.description,
    required this.imageUrlConvience,
  });
}

List<PasakSeating> pasakSeatings = [
  PasakSeating(
            imageUrlExterior: 'assets/images/trainimage/2ndjr_Exterior.png',
            imageUrlInterior: 'assets/images/trainimage/2ndjr_interior.jpg',
            imageUrlSeatchart: 'assets/images/seatchart/บนทปJR.png',
            coachname: 'ชั้น 2 บนทป.JR รถนอนปรับอากาศชั้น 2 รุ่น JR-West',
            description: '',
            imageUrlConvience: 'assets/images/convience/ความสะดวก_CNR_andfirst.png',
          ),
  PasakSeating(
            imageUrlExterior: 'assets/images/trainimage/3rdบชส_Exterior.jpg',
            imageUrlInterior: 'assets/images/trainimage/3rdบชส_interior.jpg',
            imageUrlSeatchart: 'assets/images/seatchart/บชส76.png',
            coachname: 'ชั้น 3 บชส.76 รถนั่งพัดลม ชั้น 3',
            description: '',
            imageUrlConvience: 'assets/images/convience/ความสะดวก_บชส_กซข.png',
          ),
];

class PasakFare {
  //คิดค่าโดยสาร
  String coachname;
  String seattype;
  String price;
  String notes;

  PasakFare({required this.coachname, required this.seattype, required this.price, required this.notes});
}

List<PasakFare> pasakfare = [
  PasakFare(
    coachname: 'ชั้น 2 บนทป.JR รถนอนปรับอากาศชั้น 2 รุ่น JR-West',
    seattype: 'นั่งปรับอากาศ ไป-กลับ',
    price: '560 บาท',
    notes: 'ขึ้นที่กรุงเทพ-อยุธยา'
  ),
  PasakFare(
    coachname: 'ชั้น 3 บชส.76 รถนั่งพัดลมชั้น 3',
    seattype: 'นั่งพัดลม ไป-กลับ',
    price: '330 บาท',
    notes: 'ขึ้นที่กรุงเทพ-อยุธยา'
  ),
  PasakFare(
    coachname: 'ชั้น 2 บนทป.JR รถนอนปรับอากาศชั้น 2 รุ่น JR-West',
    seattype: 'นั่งปรับอากาศ ไป-กลับ',
    price: '260 บาท',
    notes: 'ขึ้นที่สระบุรี-แก่งคอย'
  ),
  PasakFare(
    coachname: 'ชั้น 3 บชส.76 รถนั่งพัดลมชั้น 3',
    seattype: 'นั่งพัดลม ไป-กลับ',
    price: '130 บาท',
    notes: 'ขึ้นที่สระบุรี-แก่งคอย'
  ),
];

class PasakStationStopList {
  String stationName; //ชื่อสถานีที่จอด
  String time; //เวลาที่จอดสถานีตามตารางเดินรถ

  PasakStationStopList({
    required this.stationName,
    required this.time,
  });
}

List<PasakStationStopList> pasakStationStopLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  PasakStationStopList(stationName: 'กรุงเทพ', time: '06:00'),
  PasakStationStopList(stationName: 'สามเสน', time: '06:15'),
  PasakStationStopList(stationName: 'ชุมทางบางซื่อ', time: '06:24'),
  PasakStationStopList(stationName: 'ดอนเมือง', time: '06:51'),
  PasakStationStopList(stationName: 'รังสิต', time: '07:02'),
  PasakStationStopList(stationName: 'อยุธยา', time: '07:41'),
  PasakStationStopList(stationName: 'สระบุรี', time: '08:23'),
  PasakStationStopList(stationName: 'ชุมทางแก่งคอย', time: '08:23'),
  PasakStationStopList(stationName: 'จุดชมวิวรถไฟลอยนํ้า', time: '09:25'),
  PasakStationStopList(stationName: 'โคกสลุง', time: '09:50'),
  PasakStationStopList(stationName: 'เขื่อนป่าสักชลสิทธิ์', time: '10:35'),
  PasakStationStopList(stationName: 'เขื่อนป่าสักชลสิทธิ์', time: '15:30'),
  PasakStationStopList(stationName: 'ชุมทางแก่งคอย', time: '16:12'),
  PasakStationStopList(stationName: 'สระบุรี', time: '16:12'),
  PasakStationStopList(stationName: 'อยุธยา', time: '17:08'),
  PasakStationStopList(stationName: 'รังสิต', time: '17:49'),
  PasakStationStopList(stationName: 'ดอนเมือง', time: '18:01'),
  PasakStationStopList(stationName: 'ชุมทางบางซื่อ', time: '18:28'),
  PasakStationStopList(stationName: 'สามเสน', time: '18:36'),
  PasakStationStopList(stationName: 'กรุงเทพ', time: '18:50'),
];
