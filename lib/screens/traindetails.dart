import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:train_planner/screens/stationdetails.dart';



class TrainDetails extends StatefulWidget {


  @override
  _TrainDetailsState createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  late TimetableDataSource _timetableDataSource;

  @override
  void initState() {
    super.initState();
  }
  
  TabBar get _tabBar => TabBar(
      indicatorColor: Colors.black, 
      labelColor: Colors.black,
      indicatorWeight: 7,
      unselectedLabelColor: Colors.black, 
      labelStyle: GoogleFonts.prompt(color: Colors.black,fontSize: 17,),
      tabs: [
        new Container(
                    height: 80.0,
                    child: new Tab(text: 'ช่วงเวลา',icon: Image.asset('assets/images/clock.png',width: 35,),),
                  ),
       new Container(
                    height: 80.0,
                    child: new Tab(text: 'ขบวนรถ',icon: Image.asset('assets/images/train1.png',width: 35,),),
                  ),
        new Container(
                    height: 80.0,
                    child: new Tab(text: 'ค่าโดยสาร',icon: Image.asset('assets/images/price.png',width: 35,),),
                  ),
      ],
      
    );

  


  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
  child: Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'ขบวน 7 ด่วนพิเศษดีเซลราง',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                            fontWeight: FontWeight.bold,),
                  
                ),
                TextSpan(text: "\n"),
                TextSpan( //สถานีต้นทางของขบวนนั้นๆ
                  text: 'กรุงเทพอภิวัฒน์',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                )

                ),
                TextSpan(
                  text: ' - ',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                )

                ),
                TextSpan( //สถานีปลายทางของขบวนนั้นๆ
                  text: 'เชียงใหม่',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                )

                )
              ]),
        ),
      ),
      iconTheme: IconThemeData(
      color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
       //title: Text('AppBar'),
      
      
      bottom: PreferredSize(
        preferredSize: new Size(200.0, 100.0),
        child: Container(
          child: Column(
            children: [    
            Material(
              elevation: 18.0,
              color: Color.fromARGB(255, 138, 237, 153),
              child: Theme( //<-- SEE HERE
                data: ThemeData().copyWith(splashColor: Colors.white),
                child: _tabBar),
            ),
          ],),
        )
        
      ),
    ),
    
    body: TabBarView(
      children: [ 
        Container( //tab ที่ 1
          color: Color.fromARGB(255, 255, 255, 255),
          
          child: Column(
            children: [
              Container(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,top: 18,right: 18,bottom: 10),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                      height: 40, 
                      color: Color.fromARGB(255, 255, 255, 255),
                      child:Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10),
                        child: Container(
                          color: Color(0xff009889),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
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
                    color: Color.fromARGB(255, 255, 255, 255), 
                  ),
                  //เนื้อหาตารางใหม่
                  SizedBox(
                    child: Container(
                      height: 370,
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
                                itemCount: stationStopLists.length,
                                itemBuilder: (BuildContext context, int index){
                                  StationStopList stationStopList = stationStopLists[index];
                                  return Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0.0, 0, 2.0),
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 199, 249, 204),
                                          borderRadius: BorderRadius.circular(0.0),                  
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                        children: [
                                
                                          Container(
                                            width: 220,
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                            onTap: () { //link ไปหน้ารายละเอียดของแต่ละสถานีได้ตาม index
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetails()),);
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
            SizedBox(height: 2,),
            ElevatedButton(                       
             onPressed: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return DialogScene();
                  });
             },
            
              child: Text("ทัศนียภาพข้างทางที่พบได้", //สร้างแผนใหม่
              style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
              style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 50),
              backgroundColor: Color.fromARGB(255, 56, 163, 165),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
            ),
          ),
                                    
         ),
              
            ],
          ),
          
        ),
        Container( //tab ที่ 2
          color: Color.fromARGB(255, 255, 255, 255),
          child:  SingleChildScrollView(
          
          child: Column( 
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 249, 204),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
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
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 2.0,
                                  ),
                                  SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [ //ผังขบวนรถซึ่งแต่ละขบวนจะไม่เหมือนกัน สามารถเลื่อนซ้ายขวาได้
                                      Image.asset('assets/images/trainchart/trainchart_sprinter.png',height: 30,) //ผังขบวนรถตามเลขขบวน
                                   ],
                                   ),
                                         ),
                                         SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "เชียงใหม่", //ชื่อสถานีปลายทางของแต่ละขบวน
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),                    
                          ),                      
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end, 
                            children: [
                          
                          Text(
                            "กรุงเทพอภิวัฒน์", //ชื่อสถานีต้นทางของแต่ละขบวน
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
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
              SizedBox(height: 10,),
              SizedBox(
                height: 370,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: RawScrollbar(
                    thumbColor: Color.fromARGB(255, 130, 130, 130),
                    radius: Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: seats.length,
                      itemBuilder: (BuildContext context, int index){
                        Seating seating = seats[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                              height: 550,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                                
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                                    seating.coachname, //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 5.0,
                                  ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                   height: 120.0, 
                                   width: 135.0, //200
                                   image: AssetImage(seating.imageUrlExterior),
                                  fit: BoxFit.cover,
                                  ),
                                ),
                               
                              
                                ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                   height: 120.0, 
                                   width: 135.0, //200
                                   image: AssetImage(seating.imageUrlInterior),
                                  fit: BoxFit.cover,
                                  ),
                                ),
                        
                        
                          
                                ],
                             ),
                    SizedBox(height: 5,),
                    Text(seating.description,style: GoogleFonts.prompt(fontSize: 14,color: Colors.black)),

                    Text('ผังที่นั่ง' ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5,),
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255),
                              
                      ),
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           
                        Padding(
                          padding: const EdgeInsets.only(left: 2,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "ทิศเที่ยวไป", 
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color:Colors.red)
                            ),
                            
                            
                          ),
                          SizedBox(width: 80,),
                          Text(
                            "ทิศเที่ยวกลับ",
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color:Color.fromARGB(255, 4, 0, 226))
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 4, 0, 226),
                            size: 20,
                          ),
                          
                          ],
                        ),
                        ),
                        SizedBox(height: 5,),
                        Column(
                             children: [
                               Container(
                                 padding: const EdgeInsets.only(left: 10,right: 10),
                                 child: SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                      Image(
                                        height: 120.0, 
                                        //width: 200.0, //200
                                        image: AssetImage(seating.imageUrlSeatchart),
                                        fit: BoxFit.cover,
                                        )
                                   ],
                                   ),
                                         ),
                               ),
                             ],
                           ),
                           SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "เชียงใหม่", //สถานีปลายทาง
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          
                          
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end, 
                            children: [
                          
                          Text(
                            "กรุงเทพอภิวัฒน์", // สถานีต้นทาง
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          
                          ],
                        ),
                        
                          
                        ]),
                    ),
                    SizedBox(height: 15,),
                    Text('สิ่งอำนวยความสะดวก' ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
                    //SizedBox(height: 5,),
                    Image(
                      height: 40.0, 
                      //width: 200.0, //200
                      image: AssetImage(seating.imageUrlConvience),
                      fit: BoxFit.cover,
                      )
                     ],
                          ),
                          
                          ),
                        
                          
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  
                ),              
              ),
                           
            ],          
          ),
          ),
        ), 
        Container( //tab ที่ 3
          color: Color.fromARGB(255, 255, 255, 255),
          child:  SingleChildScrollView(
          
          child: Column( 
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 249, 204),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'สถานีต้นทาง', //ชื่อของตู้โดยสาร
                                style: GoogleFonts.prompt(fontSize: 13,color: Colors.black,),
                                softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis, // new
                                ),
                                  
                              SizedBox(
                                    height: 2.0,
                              ),
                              Container(
                              height: 30.0,
                              child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              showSelectedItems: true,
                              items: [
                                //เอามาจากรายชื่อสถานีใน Database
                                '  กรุงเทพ',
                                '  ฉะเชิงเทรา',
                                '  ชลบุรี',
                                '  พัทยา',
                                '  บ้านพลูตาหลวง',
                                
                              ],
                                dropdownSearchDecoration: InputDecoration( //ต้นทาง
                                  
                                  hintText: " เลือกสถานี...",
                                  enabledBorder: 
                                  OutlineInputBorder(                                           
                                  borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                                  borderRadius:
                                    BorderRadius.circular(10.0),
                                  ),
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                  vertical: 4.0),
                                  filled: true, //<-- SEE HERE
                                  fillColor: const Color.fromARGB(
                                  255, 255, 255, 255),
                              
                                ),
                                onChanged: itemSelectionChanged,
                                showSearchBox: true,
                                searchFieldProps: TextFieldProps(
                                  cursorColor: Colors.red,
                                )
                                          ),
                              ),
                               SizedBox(
                                    height: 10.0,
                              ),
                              Text(
                                'สถานีปลายทาง', //ชื่อของตู้โดยสาร
                                style: GoogleFonts.prompt(fontSize: 13,color: Colors.black,),
                                softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis, // new
                                ),
                                  
                              SizedBox(
                                    height: 2.0,
                              ),
                              Container(
                              height: 30.0,
                              child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              showSelectedItems: true,
                              items: [
                                //เอามาจากรายชื่อสถานีใน Database
                                '  กรุงเทพ',
                                '  ฉะเชิงเทรา',
                                '  ชลบุรี',
                                '  พัทยา',
                                '  บ้านพลูตาหลวง',
                                
                              ],
                                dropdownSearchDecoration: InputDecoration( //ปลายทาง
                                  
                                  hintText: " เลือกสถานี...",
                                  enabledBorder: 
                                  OutlineInputBorder(                                           
                                  borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                                  borderRadius:
                                    BorderRadius.circular(10.0),
                                  ),
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                  vertical: 4.0),
                                  filled: true, //<-- SEE HERE
                                  fillColor: const Color.fromARGB(
                                  255, 255, 255, 255),
                              
                                ),
                                onChanged: itemSelectionChanged,
                                showSearchBox: true,
                                searchFieldProps: TextFieldProps(
                                  cursorColor: Colors.red,
                                )
                                          ),
                              ),
                              SizedBox(height: 10,),
                              ElevatedButton.icon(
                                    
                                  onPressed: () { //คำนวณค่าโดยสารใหม่
                                       
                                  },
                                  icon: Icon(Icons.search),
                                  label: Text("คำนวณค่าโดยสาร", 
                                  style: GoogleFonts.prompt(color: Colors.white, fontSize: 16.0),),
                                  style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300, 20),
                                  backgroundColor: Color.fromARGB(255, 56, 163, 165),
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
              SizedBox(height: 10,),
              SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: RawScrollbar(
                    thumbColor: Color.fromARGB(255, 130, 130, 130),
                    radius: Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: fare.length,
                      itemBuilder: (BuildContext context, int index){
                        Fare fares = fare[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                                
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                                    fares.coachname, //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 5.0,
                                  ),
                              SizedBox(height: 5,),
                              
                              Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center, 
                            children: [
                           
                            
                       
                          Text(
                            fares.seattype, //ประเภทที่นั่ง
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12, color:Color.fromARGB(255, 0, 0, 0))
                            ),
                            
                            
                          ),

                          Text(
                            fares.price, //ราคาค่าโดยสาร
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color:Color.fromARGB(255, 4, 0, 226))
                            ),
                            
                            
                          ),
                          
                          
                          ],
                        ),
                                
                              
                     ],
                          ),
                          
                          ),
                        
                          
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  
                ),
                
                
              ),
                      
            ],
            
          ),
          

          ),
        ),
      ],
    ),
  ),  
  );
  
  void itemSelectionChanged(String? originStation) {
    print('items');
    print(originStation); //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
  }

}

class TimetableDataSource extends DataGridSource{
  


  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){
        return Container(
          alignment: (dataGridCell.columnName == 'สถานี')
            ? Alignment.centerLeft
            : Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Text(dataGridCell.value.toString(),style: GoogleFonts.prompt(fontSize: 14),
                          overflow: TextOverflow.ellipsis),
        );
      }).toList());
  }
}

class TrainTimetable{ //ช่วงเวลา (ตารางเวลา) ของแต่ละขบวน
  TrainTimetable(this.station, this.deptime);
  final String station; //สถานี
  final String deptime; //เวลาจอดที่สถานี
}



class Seating { //รายละเอียดขบวน (ที่นั่ง ชนิดรถ รูปรถภายนอกภายใน)
  String imageUrlExterior;  //รูปภายนอกรถ
  String imageUrlInterior;  //รูปภายในรถ
  String imageUrlSeatchart; //รูปผังที่นั่ง
  String coachname;         //ชื่อชนิดรถ
  String description;       //คำอธิบายเพิ่มเติม (เช่น ไม่มีบริการอาหาร)
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

class Fare{  //คิดค่าโดยสาร
  String coachname;
  String seattype;
  String price;

  Fare({
    required this.coachname,
    required this.seattype,
    required this.price
  });
}
List<Fare> fare = [
  Fare(
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ สปรินเตอร์',
    seattype: 'นั่งปรับอากาศ (ไม่มีบริการอาหาร)',
    price: '638 บาท',
  ),
];

class DialogScene extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height:300,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,5),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('ทัศนีย์ภาพเด่น', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Container(
          //color: Colors.blue,
          height: 240.0,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            Destination destination = destinations[index];
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
                      Text(destination.scenename,
                             style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                              )),
                      Text(destination.betweenstation,
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

              ]),

            ),
          )
        ],
      ),
    );
  }
}

List<Seating> seats = [
  
  Seating(
    imageUrlExterior: 'assets/images/trainimage/2nddaewoo_Exterior.png',
    imageUrlInterior: 'assets/images/trainimage/2nddaewoo_interior.jpg',
    imageUrlSeatchart: 'assets/images/seatchart/กซขป76.png',
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ แดวู',
    description: 'มีบริการอาหาร ของว่าง และเครื่องดื่ม',
    imageUrlConvience: 'assets/images/convience/ความสะดวก_กซขป.png',

  ),
];

class Destination {
  String imageUrl;
  String scenename;
  String betweenstation;


  Destination({
    required this.imageUrl,
    required this.scenename,
    required this.betweenstation,
  });
}
List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/chiangmai.jpg',
    scenename: 'แม่นำ้บางปะกง',
    betweenstation: 'สถานีฉะเชิงเทรา-ดอนสีนนท์',

  ),
  Destination(
    imageUrl: 'assets/images/nongkai.jpg',
    scenename: 'แกรนด์แคนยอนชลบุรี',
    betweenstation: 'สถานีชลบุรี-บางพระ',

  ),
  
];

class StationStopList {
  String stationName; //ชื่อสถานีที่จอด
  String time;        //เวลาที่จอดสถานีตามตารางเดินรถ

  StationStopList({
    required this.stationName,
    required this.time,
    
  });
}
List <StationStopList> stationStopLists = [ //รายชื่อสถานีที่ขบวนที่ระบุจอด พร้อมเวลา
  StationStopList(stationName: 'กรุงเทพอภิวัฒน์',time: '09:05'),
  StationStopList(stationName: 'ดอนเมือง',time: '09:20'),
  StationStopList(stationName: 'รังสิต',time: '09:29'),
  StationStopList(stationName: 'อยุธยา',time: '09:55'),
  StationStopList(stationName: 'ลพบุรี',time: '10:29'),
  StationStopList(stationName: 'นครสวรรค์',time: '11:40'),
  StationStopList(stationName: 'ตะพานหิน',time: '12:26'),
  StationStopList(stationName: 'พิจิตร',time: '12:46'),
  StationStopList(stationName: 'พิษณุโลก',time: '13:22'),
  StationStopList(stationName: 'อุตรดิตถ์',time: '14:27'),
  StationStopList(stationName: 'ศิลาอาสน์',time: '14:33'),
  StationStopList(stationName: 'เด่นชัย',time: '15:24'),
  StationStopList(stationName: 'บ้านปิน',time: '15:57'),
  StationStopList(stationName: 'นครลำปาง',time: '17:33'),
  StationStopList(stationName: 'ขุนตาน',time: '18:23'),
  StationStopList(stationName: 'ลำพูน',time: '19:15'),
  StationStopList(stationName: 'เชียงใหม่',time: '19:30'),
];