import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:train_planner/models/result_model.dart';
import 'package:train_planner/widgets/addSearchResultNew.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';
import 'package:train_planner/screens/traindetails.dart';
import 'package:train_planner/screens/stationTouristAttractions.dart';



class StationDetails extends StatefulWidget {
  const StationDetails({ Key? key }) : super(key: key);

  @override
  _StationDetailsState createState() => _StationDetailsState();
}

class _StationDetailsState extends State<StationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        //title: Text('ผลการค้นหาเพิ่มในแผน', style: GoogleFonts.prompt(color: Colors.black),),
        
        
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text('สถานีรถไฟ', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                              fontWeight: FontWeight.bold,),),
                        Text('เชียงใหม่', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22, // title ชื่อสถานีดึงตาม database
                              fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Row( //หัวใจรายการโปรด
                      children: <Widget>[
                        
                        
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
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 10,),
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
            color: Color.fromARGB(255, 255, 255, 255), 
          ),
          Container(
            height: 50, 
            color: Color.fromARGB(255, 204, 204, 204),
            child:Padding(
              padding: const EdgeInsets.only(left:10.0, right: 10),
              child: Row(
                children: [
                Text(
                  "กำหนดเวลาเดินรถ สถานี",
                   style: GoogleFonts.prompt(
                   color: Colors.black,
                   fontSize: 16.0,
                  ),
                ),
                Text(
                  "เชียงใหม่",
                   style: GoogleFonts.prompt(
                   color: Colors.black,
                   fontSize: 16.0,
                  ),
                ),
              ]),
            ),
          ),
          Container(
            height: 30, 
            color: Color.fromARGB(255, 204, 204, 204),
            child:Padding(
              padding: const EdgeInsets.only(left:30.0, right: 30),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,
                  children: [
                  Text(
                    "  ขบวน",
                     style: GoogleFonts.prompt(
                     color: Colors.black,
                     fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    "ต้นทาง",
                     style: GoogleFonts.prompt(
                     color: Colors.black,
                     fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 75,),
                  Text(
                    "ปลายทาง",
                     style: GoogleFonts.prompt(
                     color: Colors.black,
                     fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 65,),
                  Text(
                    "เวลา",
                     style: GoogleFonts.prompt(
                     color: Colors.black,
                     fontSize: 12.0,
                    ),
                  ),

                ]),
              ),
            ),
          ),
          Container(
            height: 4, 
            color: Color.fromARGB(255, 204, 204, 204), 
          ),
          SizedBox(
            
            child: Container(
              height: 300, 
              color: Color.fromARGB(255, 204, 204, 204),
              
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0, right: 30),
                  child: Container(
                    child: RawScrollbar(
                      thumbColor: Color.fromARGB(255, 34, 168, 1),
                      radius: Radius.circular(20),
                      thickness: 5,
                     // color: Color.fromARGB(255, 255, 255, 255),
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: stationTrainLists.length,
                        itemBuilder: (BuildContext context, int index) {
                          StationTrainList stationTrainList = stationTrainLists[index];
                          return Stack(
                            children: <Widget>[
                              Container(margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                              height: 20.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20.0),                  
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                              Row(  //แบ่งครึ่งหน้า
                                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                     crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                              Container(
                                width: 40,
                                child: GestureDetector(
                                onTap: () { //ไปหน้ารายละเอียดแต่ละเลขขบวน
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => TrainDetails()),);
                                },
                               child: Text(stationTrainList.trainNo, //เลขขบวน
                               style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 10.0,
                                ) ,),
                              ),
                              ),
                              //SizedBox(width: 5,),
                              Container(
                                width: 110,
                                child: Text(
                                stationTrainList.originStation, //ต้นทางขบวน
                                style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 10.0,
                                ),
                                                ),
                              ),
                                          //SizedBox(width: 5,),
                                          Container(
                        width: 110,                    
                        child: Text(
                          stationTrainList.destinationStation, //ปลายทางขบวน
                           style: GoogleFonts.prompt(
                           color: Colors.black,
                           fontSize: 10.0,
                          ),
                        ),
                                          ),
                                          //SizedBox(width: 5,),
                                          Container(
                        width: 30,
                        child: Text(
                          stationTrainList.stationTime, //เวลารถเข้า-ออก แต่ละสถานี
                           style: GoogleFonts.prompt(
                           color: Colors.black,
                           fontSize: 10.0,
                          ),
                        ),
                                          ),
                                        
                                    ]
                                    ),               
                                  ]
                                ),
                              ),
                              ),
                              Positioned(
                                right: 40.0,
                                top: 20.0,
                                bottom: 10.0,
                                child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                                
                                ),
                              )
                            ],
                          );
                        }
                                    ,
                                    ),
                      ),
                    ),
                  ),
                ),
            ),
          ),
          Container(
            height: 20, 
            color: Color.fromARGB(255, 204, 204, 204), 
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox.fromSize(
                  size: Size(100, 70),
                  
                  child: Material(
                  color: Color.fromARGB(255, 128,	237,	153),
                 child: InkWell(
        //splashColor: Colors.green, 
                    onTap: () {}, 
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Image.asset('assets/images/map.png',width: 40,), 
                       SizedBox(height: 5,),// <-- Icon
                       Text("แผนที่"), // <-- Text
                    ],
                  ),
                  ),
                ),
               ),
               SizedBox.fromSize(
                  size: Size(100, 70),
                  
                  child: Material(
                  color: Color.fromARGB(255, 128,	237,	153),
                 child: InkWell(
        //splashColor: Colors.green, 
                    onTap: () {}, 
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Image.asset('assets/images/amenities.png',width: 40,),
                       SizedBox(height: 5,), // <-- Icon
                       Text("ความสะดวก"), // <-- Text
                    ],
                  ),
                  ),
                ),
               ),
               SizedBox.fromSize(
                  size: Size(100, 70),
                  
                  child: Material(
                  color: Color.fromARGB(255, 128,	237,	153),
                 child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StationTouristAttractions()),);
                    }, 
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Image.asset('assets/images/attractions.png',width: 40,),
                       SizedBox(height: 5,), // <-- Icon
                       Text("สถานที่"), // <-- Text
                    ],
                  ),
                  ),
                ),
               ),


              ]),
              
              
              ),
          )
          
        ],
      )
    );
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

List <StationTrainList> stationTrainLists = [ //รายชื่อขบวนที่จอดที่สถานีนี้ ดูตามชื่อสถานี
  StationTrainList(
    trainNo: '109', 
    originStation: 'กรุงเทพอภิวัฒน์',
    destinationStation: 'เชียงใหม่',
    stationTime: '04:05'
  ),
  StationTrainList(
    trainNo: '102', 
    originStation: 'เชียงใหม่',
    destinationStation: 'กรุงเทพอภิวัฒน์',
    stationTime: '06:30'
  ),
  StationTrainList(
    trainNo: '9', 
    originStation: 'กรุงเทพอภิวัฒน์',
    destinationStation: 'เชียงใหม่',
    stationTime: '07:15'
  ),
  StationTrainList(
    trainNo: '13', 
    originStation: 'กรุงเทพอภิวัฒน์',
    destinationStation: 'เชียงใหม่',
    stationTime: '08:40'
  ),
  StationTrainList(
    trainNo: '8', 
    originStation: 'เชียงใหม่',
    destinationStation: 'กรุงเทพอภิวัฒน์',
    stationTime: '08:50'
  ),
  StationTrainList(
    trainNo: '408', 
    originStation: 'เชียงใหม่',
    destinationStation: 'นครสวรรค์',
    stationTime: '09:20'
  ),
  StationTrainList(
    trainNo: '51', 
    originStation: 'กรุงเทพอภิวัฒน์',
    destinationStation: 'เชียงใหม่',
    stationTime: '12:10'
  ),
  StationTrainList(
    trainNo: '407', 
    originStation: 'นครสวรรค์',
    destinationStation: 'เชียงใหม่',
    stationTime: '14:35'
  ),
  StationTrainList(
    trainNo: '52', 
    originStation: 'เชียงใหม่',
    destinationStation: 'กรุงเทพอภิวัฒน์',
    stationTime: '15:30'
  ),
  StationTrainList(
    trainNo: '14', 
    originStation: 'เชียงใหม่',
    destinationStation: 'กรุงเทพอภิวัฒน์',
    stationTime: '17:00'
  ),
  StationTrainList(
    trainNo: '10', 
    originStation: 'เชียงใหม่',
    destinationStation: 'กรุงเทพอภิวัฒน์',
    stationTime: '18:00'
  ),
  StationTrainList(
    trainNo: '7', 
    originStation: 'กรุงเทพอภิวัฒน์',
    destinationStation: 'เชียงใหม่',
    stationTime: '19:30'
  ),
  
];