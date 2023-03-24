import 'package:flutter/material.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';

class Others extends StatefulWidget {
  const Others({ Key? key }) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('ข้อมูลอื่นๆ', style: GoogleFonts.prompt(color: Colors.black),),
        ),
    );
  }
}