import 'package:flutter/material.dart';
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
            itemCount: planns.length,
            itemBuilder: (BuildContext context, int index) {
              Plann plann = planns[index];
              return Stack(
                children: <Widget>[
                  Container(margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                  height: 270.0,
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
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 87, 204, 153),
                                        shape: BoxShape.circle
                                      ),
                                      child: Icon(
                                        Icons.directions_train, size: 35.0, color: Colors.black,
                                      ),
                                    ),
                                    
                                    SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('กรุงเทพ',
                                            style: GoogleFonts.prompt(
                                            fontSize: 14.0,
                                            
                                            
                                            ),),
                                        Text(
                                            '06:45',
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            ),
                                            
                            ),
                                      ],
                                      
                                    ),
                                    
                                  ],

                                  
                                ),
                                SizedBox(height: 40,),
                                
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 87, 204, 153),
                                        shape: BoxShape.circle
                                      ),
                                      child: Icon(
                                        Icons.location_on, size: 35.0, color: Colors.black,
                                      ),
                                    ),
                                    
                                    SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('บ้านพลูตาหลวง',
                                            style: GoogleFonts.prompt(
                                            fontSize: 14.0,
                                            
                                            
                                            ),),
                                        Text(
                                            '09:50',
                                            style: GoogleFonts.prompt(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            ),
                            ),
                                      ],
                                    )
                                  ],
                                ),


                              ],





                            ),
                            ),
                            
                            //ส่วนแบ่งครึ่งที่นี่
                            Expanded(child:
                              Padding(
                                padding: const EdgeInsets.fromLTRB(1.0, 10.0, 3.0,1.0),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                "เร็ว",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0,),
                                ),
                                
                                Text(
                                "ขบวน 997",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60,),
                                Text(
                                "ชั้น 2 นั่งปรับอากาศ",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0,),
                                ),
                                Text(
                                "ที่นั้ง",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0,),
                                ),
                                Text(
                                "ราคา 170 บาท",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 15.0,),
                                ),

                                ],
                                
                                
                            ),
                              )
                              ),
                          ],
                        ),
                        
                        Divider(
                  color: Colors.black,
                ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text(
                                "ราคารวม 170 บาท",
                                style: GoogleFonts.prompt(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 20.0),
                                ElevatedButton.icon(
                                    
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
                            
                          ],
                        ),
                        


                  

                        //Timeline การเดินทาง
                        
                        
                        
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