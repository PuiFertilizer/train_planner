// เกี่ยวกับการจัด style ของกล่องข้อมูล

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyInputFieldDisabled extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputFieldDisabled({Key? key, required this.title, required this.hint, this.controller, this.widget}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          title,
          style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                          fontWeight: FontWeight.bold,),
        ),
        Container(
          height: 52,
          margin: EdgeInsets.only(top: 8.0),
          padding: EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
            
            border: Border.all(
              color:Color.fromARGB(255, 202, 202, 202),
              width: 1.0
            ),
            borderRadius: BorderRadius.circular(15),
            color:  Color.fromARGB(255, 202, 202, 202),
          ),
          child: Row(
            children: [
              Expanded(child: TextFormField(
                
                readOnly: widget==null?false:true,
                autofocus: false,
                controller: controller,
                style: GoogleFonts.prompt(color: Colors.black,fontSize: 14, 
                          ),
                decoration: InputDecoration(
                  
                  hintText: hint, enabled: false,
                  hintStyle: GoogleFonts.prompt(color: Color.fromARGB(255, 0, 0, 0),fontSize: 14,
                          ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 0
                    )
                  )
                ),
              ),
              ),
              widget==null?Container():Container(child: widget)
            ],
          ),
        )
      ]),
    );
  }
}