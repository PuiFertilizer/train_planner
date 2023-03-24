import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../widgets/NavBar.dart';
import '../screens/home.dart';
import '../screens/favourite.dart';
import '../screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/plan.dart';
import '../screens/searchresult.dart';

class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('ข่าวสารรถไฟ',
                        style: GoogleFonts.prompt(
                          
                        ),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/newsimage.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              ),

              Column(
                children: <Widget>[
                  
              SizedBox(height: 170.0) ,
              Text('   ข่าวประชาสัมพันธ์',style: GoogleFonts.prompt(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
              Column(
                children: <Widget>[
        SizedBox(
          height: 500, 
          
        ),
       
        
      ],
              )
             
              

            ],
              )
            ],
          ),
        ),
        
      ),
      
      

      
    );
  }
}