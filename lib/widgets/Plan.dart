import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_planner/screens/writeplan.dart';

import '../models/destination_model.dart';
import '../models/plan_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_planner/screens/newplanName.dart';
import '../screens/searchresult.dart';

class Plan extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 400, 
          child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: planns.length, //itemcount คือจำนวนแผนทั้งหมด
            itemBuilder: (BuildContext context, int index) {
              Plann plann = planns[index]; //index เรียงตามชื่อแผน
              return Stack(
                children: <Widget>[ //widget คือจำนวนกล่องข้อความ
                  Container(margin: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 5.0),
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                  ),
                    ],
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
                              plann.planname, //ชื่อของแผน
                              style: GoogleFonts.prompt(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600,),
                              softWrap: false,
                               maxLines: 3,
                                overflow: TextOverflow.ellipsis, // new
                               ),
                            )
                          

                        ],
                        ),
                        SizedBox(
                              height: 20.0,
                            ),
                        Text(plann.plandate ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black)),

                        // SizedBox(
                        //       height: 2.0,
                        //     ),
                        Text(plann.noOfDate ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black)),
                        
                        
                        
                      ]
                    ),
                  ),
                  ),
                  Positioned( //popup ของ 3 dots
                    right: 40.0,
                    top: 80.0,
                    bottom: 10.0,
                    child:  PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.pencil,
                              ),
                              title: Text('แก้ไข',style: GoogleFonts.prompt(),),
                              
                            ), //ไปที่หน้าแก้ไข
                            ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.delete,
                              ),
                              title: Text('ลบแผน',style: GoogleFonts.prompt(),),
                              iconColor: Colors.white,
                              tileColor: Colors.red,
                              textColor: Colors.white,
                            ),),
                        ],
                        onSelected: (int menu){
                          if (menu == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Writeplan()),);
                          }else if (menu == 2) {
                            showDialog(context: context, builder: (BuildContext context){
                              return SimpleDialog();
                            }
                            );
                          }
                        },
                        ) 
                        ,)
                    
                  
                ],
              );
            }
          ), 
        ),
        SizedBox(height: 10,),
        ElevatedButton.icon(
                                    
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => newplanPage()),);// ///
           },
          icon: Icon(Icons.add),
          label: Text("สร้างแผนการเดินทางใหม่", //สร้างแผนใหม่
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
    );
  }
}

class SimpleDialog extends StatelessWidget{ //กล่องยืนยันลบแผนการเดินทาง
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height:140,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,30,10,10),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('คุณต้องการลบแผนการเดินทางหรือไม่', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                        //ไม่ลบ
                      }, style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                      ),child: Text('ใช่', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 20) ,)
                      ),
                      SizedBox(width: 30,),
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();//ไม่ลบ
                      },style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                      ), child: Text('ไม่', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 20) ,)
                      ),
                    ],
                  ),

              ]),

            ),
          )
        ],
      ),
    );
  }
}