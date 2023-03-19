import 'package:flutter/material.dart';
import 'package:train_planner/screens/traindetails.dart';
import 'package:train_planner/screens/stationdetails.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';


class Searchresult extends StatefulWidget {
  const Searchresult({ Key? key }) : super(key: key);

  @override
  _SearchresultState createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('ผลการค้นหา', style: GoogleFonts.prompt(color: Colors.black),),
        
        
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('ผลการค้นหา', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter),
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
                          "กรุงเทพ", //ชื่อสถานีต้นทาง parse จากช่องค้นหา
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "-",
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "บ้านพลูตาหลวง", //ชื่อสถานีปลายทาง parse จากช่องค้นหา
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
              return Stack(
                children: <Widget>[
                  Container(margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                  height: 280.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 249, 204),
                    borderRadius: BorderRadius.circular(20.0),                  
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(  //แบ่งครึ่งหน้า
                          children: [
                            Expanded(child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      padding: EdgeInsets.only(left: 5),
                                      child: FloatingActionButton(
                                        elevation: 0,
                                      heroTag: null,
                                      child: Icon(Icons.train,size: 35.0, color: Colors.black),
                                      backgroundColor: Color.fromARGB(255, 87, 204, 153),
                                      onPressed: () { //***ไปหน้ารายละเอียดสถานีต้นทาง
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetails()),);//ไปหน้ารายละเอียดสถานีต้นทาง
                                    },
                                 ),
                                    ),
                                    
                                    SizedBox(width: 20.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(result.departureStation, //ชื่อสถานีต้นทาง
                                            style: GoogleFonts.prompt(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            
                                            ),), 
                                        Row(children:  <Widget>[
                                          Text(
                                            'เวลาออก  ',
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            
                                            )),
                                            Text(
                                            result.departureTime, //เวลาออกจากสถานีต้นทาง
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            )),
                                        ],) ,
                                        
                                      ],
                                      
                                    ),
                                    
                                  ],

                                  
                                ),
                                SizedBox(height: 20,),
                                
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      padding: EdgeInsets.only(left: 5),
                                      child: FloatingActionButton(
                                        elevation: 0,
                                      heroTag: null,
                                      child: Icon(Icons.location_on,size: 35.0, color: Colors.black),
                                      backgroundColor: Color.fromARGB(255, 87, 204, 153),
                                      onPressed: () { //***ไปหน้ารายละเอียดสถานีปลายทาง
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetails()),);
                                    }, //***ไปหน้ารายละเอียดสถานีปลายทาง
                                 ),
                                    ),
                                    
                                    SizedBox(width: 20.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(result.arriveStation,
                                            style: GoogleFonts.prompt(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            
                                            ),),
                                        Row(children:  <Widget>[
                                          Text(
                                            'เวลาถึง  ',
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            //fontWeight: FontWeight.w600,
                                            )),
                                            Text(
                                            result.arriveTime, //เวลาถึงที่สถานีปลายทาง
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            )),
                                        ],) ,
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
                        
                        Divider(
                        color: Colors.black,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 200,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                result.traintype,
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Text(
                                'ขบวน', //เลขขบวน
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Text(
                                result.trainNumber, //เลขขบวน
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600),
                                ),
                                  ],
                                ),
                                Text(
                                  result.classes, //ชั้นที่นั่ง เช่น 2,3
                                  style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0, ),
                                ),
                                Text(
                                  result.coachtype1, //ชนิดรถ เช่น นั่งปรับอากาศ
                                  style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0, ),
                                ),
                                
                              ],
                              )
                            ),
                            Container(
                              height: 100,
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                    
                                onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainDetails()),); //ไปหน้ารายละเอียดขบวนตามเลขขบวนที่กำหนด
                                },
                                  child: Text("รายละเอียดขบวน", //ไปหน้ารายละเอียดขบวนตามเลขขบวนที่กำหนด
                                  style: GoogleFonts.prompt(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12.0),),
                                  style: ElevatedButton.styleFrom(
                                  fixedSize: Size(130, 1),
                                  backgroundColor: Color.fromARGB(255, 87, 204, 153),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                 ),
                                  ),
                                    
                                 ),
                                  ),
                                  SizedBox(height: 2,),
                                  Container(
                                    child: ElevatedButton(
                                    
                                onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Searchresult()),);
                                },
                                  
                                  child: Text("เพิ่มในแผน",
                                style: GoogleFonts.prompt(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12.0),),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(130, 1),
                                  backgroundColor: Color.fromARGB(255, 87, 204, 153),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                 ),
                                  ),
                                    
                                 ),
                                  ),
                               ],
                              ),
    
                            ),
                            
                            Row(
                              
                            ),         
                          ],
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
          ),
          )
          
        ],
      )
    );
  }
}
//เก็บข้อมูลรายการผลการค้นหา

class Result {
  String departureStation; //สถานีต้นทาง
  String departureTime;    //เวลาออกต้นทาง
  String arriveStation;    //สถานีปลายทาง
  String arriveTime;       //เวลาถึงปลายทาง
  String traintype;        //ประเภทขบวนรถ (เช่น ด่วนพิเศษ ด่วน เร็ว)
  String trainNumber;      //เลขขบวนรถ
  String classes;          //ชั้นที่นั่ง
  String coachtype1;
  String coachtype2;
  
           

  Result({
    required this.departureStation,
    required this.departureTime,
    required this.arriveStation,
    required this.arriveTime,
    required this.traintype,
    required this.trainNumber,
    required this.classes,
    required this.coachtype1,
    required this.coachtype2,
  });
}

List <Result> results = [
  Result(
    departureStation: 'กรุงเทพอภิวัฒน์', 
    departureTime: '09:05', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '19:30', 
    traintype: 'ด่วนพิเศษดีเซลราง', 
    trainNumber: '7', 
    classes: 'ชั้น 2',
    coachtype1: 'รถนั่งปรับอากาศ',
    coachtype2: ''
    
  ),

  Result(
    departureStation: 'กรุงเทพอภิวัฒน์', 
    departureTime: '14:15', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '04:05', 
    traintype: 'เร็ว', 
    trainNumber: '109', 
    classes: 'ชั้น 3, 2',
    coachtype1: 'รถนั่งพัดลม',
    coachtype2: 'รถนอนปรับอากาศ'
    
  ),

  Result(
    departureStation: 'กรุงเทพอภิวัฒน์', 
    departureTime: '18:40', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '07:15', 
    traintype: 'ด่วนพิเศษ CNR', 
    trainNumber: '9', 
    classes: 'ชั้น 2, 1',
    coachtype1: 'รถนอนปรับอากาศ',
    coachtype2: ''
    
  ),

  Result(
    departureStation: 'กรุงเทพอภิวัฒน์', 
    departureTime: '20:05', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '08:40', 
    traintype: 'ด่วนพิเศษ', 
    trainNumber: '13', 
    classes: 'ชั้น 3, 2, 1',
    coachtype1: 'รถนั่งพัดลม',
    coachtype2: 'รถนอนปรับอากาศ'
    
  ),

  Result(
    departureStation: 'กรุงเทพอภิวัฒน์', 
    departureTime: '22:30', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '12:10', 
    traintype: 'ด่วน', 
    trainNumber: '51', 
    classes: 'ชั้น 3, 2',
    coachtype1: 'รถนั่งพัดลม',
    coachtype2: 'รถนอนปรับอากาศ'
    
  ),
  
];