import 'package:flutter/material.dart';
import '../screens/news.dart';
import '../screens/planner.dart';
import '../main.dart';
import '../screens/home.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('ข่าวสาร'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
            },
          ),
          ListTile(
            leading: Icon(Icons.ev_station),
            title: Text('รายชื่อสถานี'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
            },
          ),
        ],
      ),
    );
  }
}