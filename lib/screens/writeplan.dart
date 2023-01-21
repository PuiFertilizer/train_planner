import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';

class Writeplan extends StatefulWidget {
  const Writeplan({ Key? key }) : super(key: key);

  @override
  _WriteplanState createState() => _WriteplanState();
}

class _WriteplanState extends State<Writeplan> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('สร้างแผนการเดินทางใหม่', style: GoogleFonts.prompt(color: Colors.black),),       
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('สร้างแผนการเดินทางใหม่', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),),
                      Text('ตั้งชื่อการเดินทาง (ไม่เกิน 50 ตัว)', style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                          fontWeight: FontWeight.bold,),),  
                      Container(
                        height: 50,
                        width: 350,
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:Colors.grey,
                            width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Row(children: [
                          Expanded(child: 
                            TextFormField(
                              
                            )
                          )
                        ]),
                      )  
                    ],
                  ),
                )
              ]
            ),
            ),
            
            
        ],
      ),
    );
  }
}