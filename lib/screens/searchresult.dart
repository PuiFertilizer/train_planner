import 'package:flutter/material.dart';
import 'package:train_planner/models/result_model.dart';
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
                          "กรุงเทพ",
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "บ้านพลูตาหลวง",
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
            child: new ListView.builder(
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
                                      onPressed: () { //ไปหน้าของชื่อสถานีต้นทาง
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetails()),);
                                    },
                                 ),
                                    ),
                                    
                                    SizedBox(width: 20.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(result.departureStation,
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
                                            result.departureTime,
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
                                      onPressed: () { //ไปหน้าของชื่อสถานีต้นทาง
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StationDetails()),);
                                    },
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
                                            result.arriveTime,
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
                                SizedBox(width: 20),
                                Text(
                                result.trainNumber,
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600),
                                ),
                                  ],
                                ),
                                Text(
                                  'ชั้น 2',
                                  style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0, ),
                                ),
                                Text(
                                  'รถนั่งปรับอากาศ',
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
                                    child: ElevatedButton.icon(
                                    
                                onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => TrainDetails()),);
                                },
                                  icon: Icon(Icons.add, size: 20.0, color: Colors.black,),
                                  label: Text("รายละเอียดขบวน",
                                style: GoogleFonts.prompt(color: Colors.white, fontSize: 11.0),),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(110, 1),
                                  backgroundColor: Color.fromARGB(255, 87, 204, 153),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                 ),
                                  ),
                                    
                                 ),
                                  ),
                                  SizedBox(height: 2,),
                                  Container(
                                    child: ElevatedButton.icon(
                                    
                                onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Searchresult()),);
                                },
                                  icon: Icon(Icons.add, size: 20.0, color: Colors.black,),
                                  label: Text("เพิ่มในแผน",
                                style: GoogleFonts.prompt(color: Colors.white, fontSize: 11.0),),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(110, 1),
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