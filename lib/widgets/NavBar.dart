import 'package:flutter/material.dart';
import '../screens/news.dart';
import '../screens/stationlist.dart';
import '../screens/planner.dart';
import '../main.dart';
import '../screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 199, 249, 204),
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('ข่าวสาร',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('รายชื่อสถานี',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Stationlist()));
            },
          ),
          ListTile(
            leading: Icon(Icons.tour),
            title: Text('โปรแกรมท่องเที่ยวรถไฟ',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
            },
          ),
          ListTile(
            leading: Icon(Icons.train),
            title: Text('ข้อมูลขบวนรถ',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
            },
          ),
          ListTile(
            leading: Icon(Icons.route),
            title: Text('เส้นทางรถไฟ',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time_filled),
            title: Text('กำหนดเวลาเดินรถ',style: GoogleFonts.prompt(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w600,),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
            },
          ),

        ],
      ),
    );
  }
}