import 'package:flutter/material.dart';
import 'package:train_planner/screens/tourtraindetails_suanson.dart';
import '../models/tourtrain_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/tourtraindetails_Namtok.dart';
import '../screens/tourtraindetails_pasak.dart';
import '../screens/trainlist.dart';


class Tourtrain_Carousel extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ท่องเที่ยวกับการรถไฟแห่งประเทศไทย',
                style: GoogleFonts.prompt(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ]),
        
        ),
        SizedBox(height: 10,),
        Container(
          //color: Colors.blue,
          height: 210.0,
          //color: Colors.blue,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(decoration: BoxDecoration(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: GestureDetector(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Tourtraindetails_Namtok()));                       
                          },
                          child: Container(
                            height: 140.0, 
                            width: 200.0,
                            decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/namtok.jpg'),
                              fit: BoxFit.cover
                             ),
                            borderRadius: BorderRadius.circular(15)
                                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start
                        ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('นำ้ตกไทรโยคน้อย',
                                 style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  )),
                          Text('มีทุกวันหยุดตลอดปี',
                          style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 80, 80, 80),
                            fontSize: 12.0,
                          ),),
                        ],
                                          ),
                      ),
                    ]),
                      
              ),
            ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(decoration: BoxDecoration(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: GestureDetector(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Tourtraindetails_Suanson()));                       
                          },
                          child: Container(
                            height: 140.0, 
                            width: 200.0,
                            decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/suanson.jpg'),
                              fit: BoxFit.cover
                             ),
                            borderRadius: BorderRadius.circular(15)
                                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start
                        ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('สวนสนประดิพัทธ์',
                                 style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  )),
                          Text('มีทุกวันหยุดตลอดปี',
                          style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 80, 80, 80),
                            fontSize: 12.0,
                          ),),
                        ],
                                          ),
                      ),
                    ]),
                      
              ),
            ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(decoration: BoxDecoration(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: GestureDetector(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Tourtraindetails_Pasak()));                       
                          },
                          child: Container(
                            height: 140.0, 
                            width: 200.0,
                            decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/pasak1.jpg'),
                              fit: BoxFit.cover
                             ),
                            borderRadius: BorderRadius.circular(15)
                                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start
                        ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('เขื่อนป่าสักชลสิทธ์',
                                 style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  )),
                          Text('มีเฉพาะวันหยุดเดือน พ.ย. - ม.ค.',
                          style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 80, 80, 80),
                            fontSize: 12.0,
                          ),),
                        ],
                                          ),
                      ),
                    ]),
                      
              ),
            ),
            SizedBox(width: 25,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(decoration: BoxDecoration(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: GestureDetector(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Trainlist()));                       
                          },
                          child: Container(
                            height: 140.0, 
                            width: 200.0,
                            decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/steam.jpg'),
                              fit: BoxFit.cover
                             ),
                            borderRadius: BorderRadius.circular(15)
                                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('รถจักรไอนํ้า',
                                 style: GoogleFonts.prompt(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  )),
                          Text('มีเฉพาะ 5 ครั้งต่อปี',
                          style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 80, 80, 80),
                            fontSize: 12.0,
                          ),),
                        ],
                                          ),
                      ),
                    ]),
                      
              ),
            ),
            SizedBox(width: 25,),

          ],
          ),
          ),
        
        ),
        SizedBox(height: 15,),
      ]
    );
  }
}