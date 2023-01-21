import 'package:flutter/material.dart';
import 'package:train_planner/screens/writeplan.dart';

import '../models/destination_model.dart';
import '../models/plan_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
            itemCount: planns.length,
            itemBuilder: (BuildContext context, int index) {
              Plann plann = planns[index];
              return Stack(
                children: <Widget>[
                  Container(margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 5.0),
                  height: 170.0,
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
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 110.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                              plann.planname,
                              style: GoogleFonts.prompt(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600,),
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
                        Text(plann.plandate ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black)),

                        SizedBox(
                              height: 5.0,
                            ),
                        Text(plann.description ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black)),
                        
                        
                        
                      ]
                    ),
                  ),
                  ),
                  Positioned(
                    right: 40.0,
                    top: 20.0,
                    bottom: 10.0,
                    child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 100.0,
                      image:AssetImage(
                          plann.imageUrl
                      ),
                      fit: BoxFit.cover,
                    ),
                    ),
                  )
                ],
              );
            }
          ), 
        ),
        SizedBox(height: 10,),
        ElevatedButton.icon(
                                    
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Writeplan()),);
           },
          icon: Icon(Icons.add),
          label: Text("เพิ่มแผนใหม่", //สร้างแผนใหม่
          style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
          style: ElevatedButton.styleFrom(
          fixedSize: Size(200, 40),
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