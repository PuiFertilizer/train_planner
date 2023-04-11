//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//import 'package:syncfusion_flutter_core/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:train_planner/screens/stationdetails.dart';
import '../models/traindatalist.dart';

class TrainDetails extends StatefulWidget {
  const TrainDetails({super.key, required this.train});
  final String train;
  @override
  _TrainDetailsState createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  late TimetableDataSource _timetableDataSource;
  late TrainList traindetail;
  @override
  void initState() {
    super.initState();
  }

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
              text: 'ช่วงเวลา',
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
              text: 'ค่าโดยสาร',
              icon: Image.asset(
                'assets/images/price.png',
                width: 35,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    getTrainDetail();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'ขบวน ${widget.train}',
                  style: GoogleFonts.prompt(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: "\n"),
                TextSpan(
                    //สถานีต้นทางของขบวนนั้นๆ
                    text: traindetail.departureStation,
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                TextSpan(
                    text: ' - ',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                TextSpan(
                    //สถานีปลายทางของขบวนนั้นๆ
                    text: traindetail.arriveStation,
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 18,
                    ))
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
            tableTab(context),
            seatTab(),
            priceTab(),
          ],
        ),
      ),
    );
  }

  void getTrainDetail() {
    for (int i = 0; i < trainLists.length; i++) {
      int index = trainLists[i]
          .indexWhere((element) => element.trainNo == widget.train);
      if (index >= 0) {
        traindetail = trainLists[i][index];
        break;
      }
      if (i == trainLists.length - 1) {
        traindetail = TrainList(
            trainNo: widget.train,
            trainType: 'no detail',
            departureStation: 'no detail',
            departureTime: 'no tail',
            arriveStation: 'no tail',
            arriveTime: 'no detail',
            line: 'no detail',
            seats: [],
            desinations: [],
            chart: '');
        print("no detail");
      }
    }
  }

  Container tableTab(BuildContext context) {
    return Container(
      //tab ที่ 1
      color: const Color.fromARGB(255, 255, 255, 255),

      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
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
                      height: 200,
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
                              itemCount: stationStopLists.length,
                              itemBuilder: (BuildContext context, int index) {
                                StationStopList stationStopList =
                                    stationStopLists[index];
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
                                                                  stationStopList
                                                                      .stationName,
                                                            )),
                                                  );
                                                },
                                                child: Text(
                                                  stationStopList.stationName,
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
                                                stationStopList.time,
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
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return scene();
                  });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              backgroundColor: const Color.fromARGB(255, 56, 163, 165),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Text(
              "ทัศนียภาพข้างทางที่พบได้", //สร้างแผนใหม่
              style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Container priceTab() {
    return Container(
      //tab ที่ 3
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
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
                            Text(
                              'สถานีต้นทาง', //ชื่อของตู้โดยสาร
                              style: GoogleFonts.prompt(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              softWrap: false,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis, // new
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SizedBox(
                              height: 30.0,
                              child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: const [
                                    //เอามาจากรายชื่อสถานีใน Database
                                    '  กรุงเทพ',
                                    '  ฉะเชิงเทรา',
                                    '  ชลบุรี',
                                    '  พัทยา',
                                    '  บ้านพลูตาหลวง',
                                  ],
                                  dropdownSearchDecoration: InputDecoration(
                                    //ต้นทาง

                                    hintText: " เลือกสถานี...",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    filled: true, //<-- SEE HERE
                                    fillColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  onChanged: itemSelectionChanged,
                                  showSearchBox: true,
                                  searchFieldProps: const TextFieldProps(
                                    cursorColor: Colors.red,
                                  )),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'สถานีปลายทาง', //ชื่อของตู้โดยสาร
                              style: GoogleFonts.prompt(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                              softWrap: false,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis, // new
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            SizedBox(
                              height: 30.0,
                              child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: const [
                                    //เอามาจากรายชื่อสถานีใน Database
                                    '  กรุงเทพ',
                                    '  ฉะเชิงเทรา',
                                    '  ชลบุรี',
                                    '  พัทยา',
                                    '  บ้านพลูตาหลวง',
                                  ],
                                  dropdownSearchDecoration: InputDecoration(
                                    //ปลายทาง

                                    hintText: " เลือกสถานี...",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    filled: true, //<-- SEE HERE
                                    fillColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  onChanged: itemSelectionChanged,
                                  showSearchBox: true,
                                  searchFieldProps: const TextFieldProps(
                                    cursorColor: Colors.red,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                //คำนวณค่าโดยสารใหม่
                              },
                              icon: const Icon(Icons.search),
                              label: Text(
                                "คำนวณค่าโดยสาร",
                                style: GoogleFonts.prompt(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 20),
                                backgroundColor:
                                    const Color.fromARGB(255, 56, 163, 165),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
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
              height: 450,
              child: Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: RawScrollbar(
                  thumbColor: const Color.fromARGB(255, 130, 130, 130),
                  radius: const Radius.circular(20),
                  thickness: 5,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: fare.length,
                      itemBuilder: (BuildContext context, int index) {
                        Fare fares = fare[index];
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
                                            fares.coachname, //ชื่อของตู้โดยสาร
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
                                          fares.seattype, //ประเภทที่นั่ง
                                          style: GoogleFonts.prompt(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ),
                                        Text(
                                          fares.price, //ราคาค่าโดยสาร
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
    );
  }

  Container seatTab() {
    return Container(
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
                                  chartIMG() //ผังขบวนรถตามเลขขบวน
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 1,
                                ),
                                const Icon(
                                  Icons.arrow_back_sharp,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  traindetail
                                      .arriveStation, //ชื่อสถานีปลายทางของแต่ละขบวน
                                  style: GoogleFonts.prompt(
                                      textStyle: const TextStyle(
                                    fontSize: 12,
                                  )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  traindetail
                                      .departureStation, //ชื่อสถานีต้นทางของแต่ละขบวน
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
                      itemCount: traindetail.seats.length,
                      itemBuilder: (BuildContext context, int index) {
                        Seating seating = traindetail.seats[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 5.0),
                              height: 550,
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
                                            seating
                                                .coachname, //ชื่อของตู้โดยสาร
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
                                                seating.imageUrlExterior),
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
                                                seating.imageUrlInterior),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(seating.description,
                                        style: GoogleFonts.prompt(
                                            fontSize: 14, color: Colors.black)),

                                    Text('ผังที่นั่ง',
                                        style: GoogleFonts.prompt(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 210,
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
                                                    "ทิศเที่ยวไป",
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
                                                    "ทิศเที่ยวกลับ",
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
                                                          height: 120.0,
                                                          //width: 200.0, //200
                                                          image: AssetImage(seating
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                const Icon(
                                                  Icons.arrow_back_sharp,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  traindetail
                                                      .arriveStation, //สถานีปลายทาง
                                                  style: GoogleFonts.prompt(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  traindetail
                                                      .departureStation, // สถานีต้นทาง
                                                  style: GoogleFonts.prompt(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_sharp,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  size: 20,
                                                ),
                                              ],
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
                                          AssetImage(seating.imageUrlConvience),
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
    );
  }

  Image chartIMG() {
    if (traindetail.chart == '') {
      return Image.asset(
        'assets/other/nodatapic.png',
        height: 30,
      );
    }
    return Image.asset(
      traindetail.chart,
      height: 30,
    );
  }

  Dialog scene() {
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
                      'ทัศนีย์ภาพเด่น',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  //color: Colors.blue,
                  height: 240.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: traindetail.desinations.length,
                    itemBuilder: (BuildContext context, int index) {
                      Destination destination = traindetail.desinations[index];
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 210.0,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Container(
                                  height: 205.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                      //ทำเงาดำ
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 10.0,
                                        ),
                                      ]),

                                  //Padding
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(destination.scenename,
                                            style: GoogleFonts.prompt(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0,
                                            )),
                                        Text(
                                          destination.betweenstation,
                                          style: GoogleFonts.prompt(
                                            color: const Color.fromARGB(
                                                255, 80, 80, 80),
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
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
                                    child: Column(
                                      //wra[]
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: const <Widget>[
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
              ]),
            ),
          )
        ],
      ),
    );
  }

  void itemSelectionChanged(String? originStation) {
    print('items');
    print(originStation); //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
  }
}

class TimetableDataSource extends DataGridSource {
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'สถานี')
            ? Alignment.centerLeft
            : Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Text(dataGridCell.value.toString(),
            style: GoogleFonts.prompt(fontSize: 14),
            overflow: TextOverflow.ellipsis),
      );
    }).toList());
  }
}

class TrainTimetable {
  //ช่วงเวลา (ตารางเวลา) ของแต่ละขบวน
  TrainTimetable(this.station, this.deptime);
  final String station; //สถานี
  final String deptime; //เวลาจอดที่สถานี
}

/*class Seating {
  //รายละเอียดขบวน (ที่นั่ง ชนิดรถ รูปรถภายนอกภายใน) แต่ละขบวนอาจมีมากกว่า 2 ชนิดได้
  String imageUrlExterior; //รูปภายนอกรถ
  String imageUrlInterior; //รูปภายในรถ
  String imageUrlSeatchart; //รูปผังที่นั่ง
  String coachname; //ชื่อชนิดรถ
  String description; //คำอธิบายเพิ่มเติม (เช่น ไม่มีบริการอาหาร)
  String imageUrlConvience; //รูป icon ความสะดวก

  Seating({
    required this.imageUrlExterior,
    required this.imageUrlInterior,
    required this.imageUrlSeatchart,
    required this.coachname,
    required this.description,
    required this.imageUrlConvience,
  });
}

List<Seating> seats = [
  Seating(
    //ชนิดที่ 1
    imageUrlExterior: 'assets/images/trainimage/2nddaewoo_Exterior.png',
    imageUrlInterior: 'assets/images/trainimage/2nddaewoo_interior.jpg',
    imageUrlSeatchart: 'assets/images/seatchart/กซขป76.png',
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ แดวู',
    description: 'มีบริการอาหาร ของว่าง และเครื่องดื่ม',
    imageUrlConvience: 'assets/images/convience/ความสะดวก_กซขป.png',
  ),
  Seating(
    //ชนิดที่ 2
    imageUrlExterior: 'assets/images/trainimage/2ndsprinter_Exterior.jpg',
    imageUrlInterior: 'assets/images/trainimage/2ndsprinter_Interior.png',
    imageUrlSeatchart: 'assets/images/seatchart/กซขป76.png',
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ สปรินเตอร์',
    description: 'มีบริการอาหาร ของว่าง และเครื่องดื่ม',
    imageUrlConvience: 'assets/images/convience/ความสะดวก_กซขป.png',
  ),
];*/

class Fare {
  //คิดค่าโดยสาร
  String coachname;
  String seattype;
  String price;

  Fare({required this.coachname, required this.seattype, required this.price});
}

List<Fare> fare = [
  Fare(
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ สปรินเตอร์',
    seattype: 'นั่งปรับอากาศ (ไม่มีบริการอาหาร)',
    price: '638 บาท',
  ),
];

class StationStopList {
  String stationName; //ชื่อสถานีที่จอด
  String time; //เวลาที่จอดสถานีตามตารางเดินรถ

  StationStopList({
    required this.stationName,
    required this.time,
  });
}

List<StationStopList> stationStopLists = [
  //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  StationStopList(stationName: 'กรุงเทพอภิวัฒน์', time: '09:05'),
  StationStopList(stationName: 'ดอนเมือง', time: '09:20'),
  StationStopList(stationName: 'รังสิต', time: '09:29'),
  StationStopList(stationName: 'อยุธยา', time: '09:55'),
  StationStopList(stationName: 'ลพบุรี', time: '10:29'),
  StationStopList(stationName: 'นครสวรรค์', time: '11:40'),
  StationStopList(stationName: 'ตะพานหิน', time: '12:26'),
  StationStopList(stationName: 'พิจิตร', time: '12:46'),
  StationStopList(stationName: 'พิษณุโลก', time: '13:22'),
  StationStopList(stationName: 'อุตรดิตถ์', time: '14:27'),
  StationStopList(stationName: 'ศิลาอาสน์', time: '14:33'),
  StationStopList(stationName: 'เด่นชัย', time: '15:24'),
  StationStopList(stationName: 'บ้านปิน', time: '15:57'),
  StationStopList(stationName: 'นครลำปาง', time: '17:33'),
  StationStopList(stationName: 'ขุนตาน', time: '18:23'),
  StationStopList(stationName: 'ลำพูน', time: '19:15'),
  StationStopList(stationName: 'เชียงใหม่', time: '19:30'),
];
