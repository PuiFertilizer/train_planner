//รายชื่อสถานที่สำคัญรอบสถานี
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:train_planner/widgets/addSearchResultNew.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';
import 'attractionsDetails.dart';



class StationTouristAttractions extends StatefulWidget {
  const StationTouristAttractions({ Key? key }) : super(key: key);

  @override
  _StationTouristAttractionsState createState() => _StationTouristAttractionsState();
}

class _StationTouristAttractionsState extends State<StationTouristAttractions> {
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
                    Text('สถานที่สำคัญโดยรอบสถานี', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),),
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
                          "สถานีรถไฟ",
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "เชียงใหม่", //ชื่อสถานีตาม parameter ชื่อสถานีเดียวกับหน้ารายละเอียดสถานี
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
          SizedBox(
            height: 10,
          ),
          Container(
            height: 2, 
            color: Color.fromARGB(255, 0, 0, 0), 
          ),
          
          SizedBox(
            
            child: Container(
              height: 400, 
              color: Color.fromARGB(255, 255, 255, 255),
              
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20),
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
                        itemCount: destinations.length,
                        itemBuilder: (BuildContext context, int index) {
                          Destination destination = destinations[index];
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => 
                              AttractionsDetails(
                                destination: destination
                              )
                              ))
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                margin: EdgeInsets.fromLTRB(0, 2.0, 0, 5.0),
                                height: 50.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(
                                    
                                    bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                     
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                Row(  //แบ่งครึ่งหน้า
                                        mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                       crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                  destination.locationName,
                                  style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 16.0,
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
                            ),
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
          
          
          
        ],
      )
    );
  }
}



class Destination {
  String imageUrl; //รูปสถานที่
  String locationName; //ชื่อสถานที่
  String locationaddress; //ที่อยู่สถานที่
  String description; //คำอธิบายสถานที่โดยย่อ
  String howtotravel; //วิธีเดินทางไป
  

  Destination({
    required this.imageUrl,
    required this.locationName,
    required this.locationaddress,
    required this.description,
    required this.howtotravel,
    
  });
}

List<Destination> destinations = [ //รายชื่อสถานที่รอบสถานี ซึ่งแต่ละสถานีจะมีไม่เหมือนกัน
  Destination(
    imageUrl: 'assets/images/nongkai.jpg',
    locationName: 'ประตูท่าแพ',
    locationaddress: 'ถนนท่าแพ ตำบลช้างคลาน อำเภอเมือง จังหวัดเชียงใหม่',
    description: 'ประตูที่ตั้งอยู่ทางทิศตะวันออก และเป็น 1 ใน 5 ประตูเมืองชั้นในของเวียงเชียงใหม่อีกด้วย ซึ่งถือได้ว่าปัจจุบันนี้ ที่นี่เป็นแค่เพียงประตูเมืองเพียงแห่งเดียวที่มีบานประตูนั่นเอง',
    howtotravel: 'จากสถานีเชียงใหม่ ให้ใช้บริการรถสี่ล้อแดงไปประตูท่าแพได้'

  ),
  Destination(
    imageUrl: 'assets/images/surat.jpg',
    locationName: 'สวนสัตว์เชียงใหม่',
    locationaddress: 'ถนนห้วยแก้ว ตำบลสุเทพ อำเภอเมือง จังหวัดเชียงใหม่',
    description: 'มีสัตว์อยู่จำนวนมาก เช่น เม่น นกยูง เสือโคร่ง เสือขาว กวาง แรด ฮิปโปเตมัส ช้าง หมี อีเห็น ยีราฟ และยังมีส่วนจัดแสดงหมีแพนด้า ช่วงช่วง และ หลินฮุ่ย ทูตจากประเทศจีนอีกด้วย',
    howtotravel: 'จากสถานีเชียงใหม่ ให้ใช้บริการรถสี่ล้อแดงไปสวนสัตว์โดยตรง'
  ),

  
];
