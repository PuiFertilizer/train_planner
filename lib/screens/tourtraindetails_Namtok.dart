import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_planner/screens/stationdetails.dart';

import '../widgets/Destination_Carousel.dart';

class Tourtraindetails_Namtok extends StatefulWidget {
  const Tourtraindetails_Namtok({Key? key}) : super(key: key);

  @override
  _Tourtraindetails_NamtokState createState() => _Tourtraindetails_NamtokState();
}

class _Tourtraindetails_NamtokState extends State<Tourtraindetails_Namtok> {


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
                  text: 'รถไฟนำเที่ยว นํ้าตกไทรโยคน้อย',
                  style: GoogleFonts.prompt(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "\n"),
                
                TextSpan(
                    text: 'มีทุกวันหยุด ตลอดปี',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 18,
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
                            'ขบวนรถพิเศษนำเที่ยวที่ 909/910',
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
                              '06:30 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153), fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'เดินทางออกจากสถานีกรุงเทพ (หัวลำโพง)',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '07:45 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ถึงสถานีนครปฐม สักการะองค์พระปฐมเจดีย์/เดินเลือกซื้อของฝากได้ 40 นาที',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '08:20 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ขบวนรถไฟพิเศษนำเที่ยวออกจากสถานีนครปฐม',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '09:35 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ถึงสะพานข้ามแม่นํ้าแคว ให้นักท่องเที่ยวชมและถ่ายภาพสะพานข้ามแม่นํ้าแควตามอัธยาศัย',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              'ขบวนรถไฟพิเศษนำเที่ยวออกจากสะพานข้ามแม่นํ้าแคว',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '10:55 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ถึงถำ้กระแซ ชมเส้นทางรถไฟสายประวัติศาสตร์สร้างโดยเชลย ศึกฝ่ายสัมพันธ์มิตร เป็นเส้นทางที่สวยที่สุดแห่งหนึ่ง ลัดเลาะไปตาม หน้าผาและป่าโปร่ง',maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '11:30 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ถึงนํ้าตกไทรโยคน้อย พักผ่อนเล่นนํ้าตกประมาณ3 ชั่วโมง', maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '14:25 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'ออกเดินทางจากนํ้าตกไทรโยคน้อย แวะชมสุสานทหารพันธมิตร', maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '16:53 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
                              'พร้อมกันที่สถานีกาญจนบุรี เพื่อขึ้นรถไฟกลับกรุงเทพฯ', maxLines: 5, style: GoogleFonts.prompt(color: Colors.black, fontSize: 12, ),
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
                              '19:25 น.', style: GoogleFonts.prompt(color: Color.fromARGB(255,87,204,153),  fontSize: 16, fontWeight: FontWeight.bold ),
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
      //tab ที่ 1/1
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
                              itemCount: namtokStationStopLists.length,
                              itemBuilder: (BuildContext context, int index) {
                                NamtokStationStopList namtokStationStopList =
                                    namtokStationStopLists[index];
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
                                                                  namtokStationStopList
                                                                      .stationName,
                                                            )),
                                                  );
                                                },
                                                child: Text(
                                                  namtokStationStopList.stationName,
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
                                                namtokStationStopList.time,
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
                                   'assets/images/trainchart/trainchart_909_910.png',
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
                                     'นํ้าตกไทรโยค', //ชื่อสถานีปลายทางของแต่ละขบวน
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
                      itemCount: namtokSeatings.length,
                      itemBuilder: (BuildContext context, int index) {
                        NamtokSeating namtokSeating = namtokSeatings[index];
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
                                           namtokSeating.coachname, //ชื่อของตู้โดยสาร
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
                                                namtokSeating.imageUrlExterior),
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
                                                namtokSeating.imageUrlInterior),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(namtokSeating.description,
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
                                                    "นํ้าตกไทรโยค",
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
                                                          image: AssetImage(namtokSeating
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
                                          AssetImage(namtokSeating.imageUrlConvience),
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
                      itemCount: namtokfare.length,
                      itemBuilder: (BuildContext context, int index) {
                        NamtokFare namtokfares = namtokfare[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 5.0),
                              height: 120,
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
                                            namtokfares.coachname, //ชื่อของตู้โดยสาร
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
                                          namtokfares.seattype, //ประเภทที่นั่ง
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ),
                                        Text(
                                          namtokfares.price, //ราคาค่าโดยสาร
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 4, 0, 226))),
                                        ),
                                      ],
                                    ),
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
          itemCount: namtokdestinations.length,
          itemBuilder: (BuildContext context, int index) {
            NamtokDestination destination = namtokdestinations[index];
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

class NamtokDestination {
  String imageUrl;
  String city;
  String description;


  NamtokDestination({
    required this.imageUrl,
    required this.city,
    required this.description,
  });
}



List<NamtokDestination> namtokdestinations = [
  NamtokDestination(
    imageUrl: 'assets/images/pathomchedi.png',
    city: 'องค์พระปฐมเจดีย์',
    description: 'สถานีนครปฐม 07:45',
  ),
  NamtokDestination(
    imageUrl: 'assets/images/Kwai_bridge.jpg',
    city: 'สะพานข้ามแม่นํ้าแคว',
    description: 'สถานีสะพานแควใหญ่ 09:35',

  ),
  NamtokDestination(
    imageUrl: 'assets/images/krasae.jpg',
    city: 'สะพานถำ้กระแซ',
    description: 'สถานีถำ้กระแซ 10:55',

  ),
  NamtokDestination(
    imageUrl: 'assets/images/namtoksaiyokenoi_stop.jpg',
    city: 'นํ้าตกไทรโยคน้อย',
    description: 'สถานีนํ้าตก 11:30',

  ),
  NamtokDestination(
    imageUrl: 'assets/images/namtoksaiyokenoi.jpg',
    city: 'นํ้าตกไทรโยคน้อย',
    description: 'สถานีนํ้าตก 11:30',

  ),
  NamtokDestination(
    imageUrl: 'assets/images/donrak.jpg',
    city: 'สุสานทหารสัมพันธมิตร',
    description: 'สถานีกาญจนบุรี 16:00',

  ),
 
];

class NamtokSeating {
  //รายละเอียดขบวน (ที่นั่ง ชนิดรถ รูปรถภายนอกภายใน) แต่ละขบวนอาจมีมากกว่า 2 ชนิดได้
  String imageUrlExterior; //รูปภายนอกรถ
  String imageUrlInterior; //รูปภายในรถ
  String imageUrlSeatchart; //รูปผังที่นั่ง
  String coachname; //ชื่อชนิดรถ
  String description; //คำอธิบายเพิ่มเติม (เช่น ไม่มีบริการอาหาร)
  String imageUrlConvience; //รูป icon ความสะดวก

  NamtokSeating({
    required this.imageUrlExterior,
    required this.imageUrlInterior,
    required this.imageUrlSeatchart,
    required this.coachname,
    required this.description,
    required this.imageUrlConvience,
  });
}

List<NamtokSeating> namtokSeatings = [
  NamtokSeating(
            imageUrlExterior: 'assets/images/trainimage/3rdthn_Exterior.jpg',
            imageUrlInterior: 'assets/images/trainimage/3rdthn_interior.jpg',
            imageUrlSeatchart: 'assets/images/seatchart/กซข74.png',
            coachname: 'ชั้น 3 กซข.74 รถดีเซลรางพัดลม รุ่น THN/NKF',
            description: '',
            imageUrlConvience: 'assets/images/convience/ความสะดวก_บชส_กซข.png',
          ),
  NamtokSeating(
            imageUrlExterior: 'assets/images/trainimage/2ndatr_Exterior.jpg',
            imageUrlInterior: 'assets/images/trainimage/2ndatr_interior.jpg',
            imageUrlSeatchart: 'assets/images/seatchart/กซมป62.png',
            coachname: 'ชั้น 2 กซมป.62 รถดีเซลรางปรับอากาศ รุ่น ATR',
            description: 'ที่นั่งไม่สามารถหมุนกลับทิศได้',
            imageUrlConvience: 'assets/images/convience/ความสะดวก_กซมป.png',
          ),
];

class NamtokFare {
  //คิดค่าโดยสาร
  String coachname;
  String seattype;
  String price;

  NamtokFare({required this.coachname, required this.seattype, required this.price});
}

List<NamtokFare> namtokfare = [
  NamtokFare(
    coachname: 'ชั้น 3 กซข.74 รถดีเซลรางพัดลม รุ่น THN/NKF',
    seattype: 'นั่งพัดลม ไป-กลับ',
    price: '120 บาท',
  ),
  NamtokFare(
    coachname: 'ชั้น 2 กซมป.62 รถดีเซลรางปรับอากาศ รุ่น ATR',
    seattype: 'นั่งปรับอากาศ ไป-กลับ',
    price: '240 บาท',
  ),
];

class NamtokStationStopList {
  String stationName; //ชื่อสถานีที่จอด
  String time; //เวลาที่จอดสถานีตามตารางเดินรถ

  NamtokStationStopList({
    required this.stationName,
    required this.time,
  });
}

List<NamtokStationStopList> namtokStationStopLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  NamtokStationStopList(stationName: 'กรุงเทพ', time: '06:30'),
  NamtokStationStopList(stationName: 'สามเสน', time: '06:44'),
  NamtokStationStopList(stationName: 'ชุมทางบางซื่อ', time: '06:51'),
  NamtokStationStopList(stationName: 'บางบำหรุ', time: '07:07'),
  NamtokStationStopList(stationName: 'ศาลายา', time: '07:22'),
  NamtokStationStopList(stationName: 'นครปฐม', time: '07:40'),
  NamtokStationStopList(stationName: 'กาญจนบุรี', time: '09:27'),
  NamtokStationStopList(stationName: 'สะพานแควใหญ่', time: '09:35'),
  NamtokStationStopList(stationName: 'ท่ากิเลน', time: '10:41'),
  NamtokStationStopList(stationName: 'สะพานถํ้ากระแซ', time: '10:56'),
  NamtokStationStopList(stationName: 'นํ้าตก', time: '11:30'),
  NamtokStationStopList(stationName: 'นํ้าตก', time: '14:30'),
  NamtokStationStopList(stationName: 'สะพานถํ้ากระแซ', time: '14:55'),
  NamtokStationStopList(stationName: 'กาญจนบุรี', time: '16:53'),
  NamtokStationStopList(stationName: 'นครปฐม', time: '18:08'),
  NamtokStationStopList(stationName: 'ศาลายา', time: '18:28'),
  NamtokStationStopList(stationName: 'บางบำหรุ', time: '18:44'),
  NamtokStationStopList(stationName: 'ชุมทางบางซื่อ', time: '19:00'),
  NamtokStationStopList(stationName: 'สามเสน', time: '19:08'),
  NamtokStationStopList(stationName: 'กรุงเทพ', time: '19:25'),
  
];


