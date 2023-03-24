import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({ Key? key }) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) =>  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
                backgroundColor: const Color.fromARGB(255, 87, 204, 153),
                title: Text("รายการโปรด", style: GoogleFonts.prompt(
                color: Colors.black,
                )),
                bottom: TabBar(
                  indicatorColor: Colors.black, 
                  labelColor: Colors.black,
                  indicatorWeight: 5,
                  unselectedLabelColor: Colors.black, 
                  labelStyle: GoogleFonts.prompt(color: Colors.black,fontSize: 13,),
                  tabs: [
                 new Container(
                      height: 70.0,
                      child: new Tab(text: 'การเดินทาง',icon: Image.asset('assets/images/clock.png',width: 35,),),
                  ),
                new Container(
                      height: 70.0,
                      child: new Tab(text: 'ขบวนรถ',icon: Image.asset('assets/images/train1.png',width: 35,),),
                    ),
                new Container(
                      height: 70.0,
                      child: new Tab(text: 'สถานี',icon: Image.asset('assets/images/price.png',width: 35,),),
                    ),
                new Container(
                      height: 70.0,
                      child: new Tab(text: 'สถานที่',icon: Image.asset('assets/images/price.png',width: 35,),),
                    ),
                ]),
              
              
              ),
          body: TabBarView(
            children: [
              Container( //tab ที่ 1
                
          
              ),
              Container( //tab ที่ 2
               color: Color.fromARGB(255, 255, 255, 255),
          
                child: Column(
                children: [
                Container(
                
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,top: 18,right: 18,bottom: 10),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                      height: 0, 
                      color: Color.fromARGB(255, 255, 255, 255),
                      
                    
                   ),
                  
                  //เนื้อหาตารางใหม่
                  SizedBox(
                    child: Container(
                      height: 510,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10),
                        child: Container(
                          child: RawScrollbar(
                            thumbColor: Color.fromARGB(255, 132, 132, 132),
                            radius: Radius.circular(20),
                            thickness: 5,
                            child: Container(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: favouriteTrainLists.length,
                                itemBuilder: (BuildContext context, int index){
                                  FavouriteTrainList favouriteTrainList = favouriteTrainLists[index];
                                  return Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0.0, 0, 10.0),
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          border: Border.all(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(5.0),
                                                            
                                      ),
                                      child: Row(
                                        
                                        children: [
                                          Container(
                                            width: 130,
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0,top: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        favouriteTrainList.trainNo,
                                                        style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.w600
                                                      ),),
                                                      SizedBox(height: 2,),
                                                      Text(
                                                      favouriteTrainList.trainType,
                                                      style: GoogleFonts.prompt(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                    ),),
                                                    ],
                                                  )
                                                ),
                                          ),
                                          
                                          Container(
                                            width: 160,
                                            alignment: Alignment.centerLeft,
                                            
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0,top: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        favouriteTrainList.departureStation,
                                                        style: GoogleFonts.prompt(
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                      ),),
                                                      SizedBox(height: 2,),
                                                      Text(
                                                      favouriteTrainList.arriveStation,
                                                      style: GoogleFonts.prompt(
                                                      color: Colors.black,
                                                      fontSize: 14.0,
                                                    ),),
                                                    ],
                                                  )
                                                ),
                                              
                                            
                                          ),
                                          Container(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 2,
                                          ),
                                          Container(
                                            color: Color.fromARGB(255, 255, 234, 0),
                                            width: 10,
                                          ),
                          
                                        ]
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
                  )
          
                  //เนื้อหาตารางใหม่
                    ],
                  ),
                ),
                
              ),
            
            
              
            ],
          ),
              ),
              Container( //tab ที่ 3
                color: Color.fromARGB(255, 189, 189, 189),
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
              Container( //tab ที่ 4
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: <Widget>[

                  ],
                ),
              )
            ]),
      ),
    );
  }

class FavouriteResult {
  String departureStation; //สถานีต้นทาง
  String departureTime;    //เวลาออกต้นทาง
  String arriveStation;    //สถานีปลายทาง
  String arriveTime;       //เวลาถึงปลายทาง
  String traintype;        //ประเภทขบวนรถ (เช่น ด่วนพิเศษ ด่วน เร็ว)
  String trainNumber;      //เลขขบวนรถ
  String classes;          //ชั้นที่นั่ง
  String coachtype1;
  String coachtype2;
  
           

  FavouriteResult({
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

List <FavouriteResult> favouriteResults = [
  FavouriteResult(
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

  FavouriteResult(
    departureStation: 'เชียงใหม่', 
    departureTime: '08:50', 
    arriveStation: 'กรุงเทพอภิวัฒน์', 
    arriveTime: '18:55', 
    traintype: 'ด่วนพิเศษดีเซลราง', 
    trainNumber: '8', 
    classes: 'ชั้น 2',
    coachtype1: 'รถนั่งปรับอากาศ',
    coachtype2: ''
    
  ),

  FavouriteResult(
    departureStation: 'หัวหิน', 
    departureTime: '08:50', 
    arriveStation: 'กรุงเทพ', 
    arriveTime: '20:20', 
    traintype: 'ธรรมดา', 
    trainNumber: '262', 
    classes: 'ชั้น 3',
    coachtype1: 'รถนั่งพัดลม',
    coachtype2: ''
    
  ),

  FavouriteResult(
    departureStation: 'นครสวรรค์', 
    departureTime: '05:00', 
    arriveStation: 'เชียงใหม่', 
    arriveTime: '14:35', 
    traintype: 'ท้องถิ่น', 
    trainNumber: '407', 
    classes: 'ชั้น 3',
    coachtype1: 'รถนั่งพัดลม',
    coachtype2: ''
    
  ),

  
  
];

class FavouriteTrainList {
  String trainNo; //เลขขบวน
  String trainType;  //ประเภทขบวน
  String departureStation; 
  String arriveStation; 

  FavouriteTrainList({
    required this.trainNo,
    required this.trainType,
    required this.departureStation,
    required this.arriveStation,
  });
}
List <FavouriteTrainList> favouriteTrainLists = [ //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  FavouriteTrainList(trainNo: '7',trainType: 'ด่วนพิเศษดีเซลราง', departureStation: 'กรุงเทพอภิวัฒน์', arriveStation: 'เชียงใหม่'),
  FavouriteTrainList(trainNo: '8',trainType: 'ด่วนพิเศษดีเซลราง', departureStation: 'เชียงใหม่', arriveStation: 'กรุงเทพอภิวัฒน์'),
  FavouriteTrainList(trainNo: '31',trainType: 'ด่วนพิเศษ CNR' ,departureStation: 'กรุงเทพอภิวัฒน์', arriveStation: 'ชุมทางหาดใหญ่'),
  FavouriteTrainList(trainNo: '32',trainType: 'ด่วนพิเศษ CNR', departureStation: 'ชุมทางหาดใหญ่', arriveStation: 'กรุงเทพอภิวัฒน์'),
  
];