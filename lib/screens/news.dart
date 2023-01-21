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
          child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: newsss.length,
            itemBuilder: (BuildContext context, int index) {
              Newss newss = newsss[index]; 
              return Stack(
                children: <Widget>[
                  Container(margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 5.0),
                  height: 380.0,
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
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Positioned(
                    right: 40.0,
                    top: 0.0,
                    bottom: 10.0,
                    child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 150.0,
                      width: 330,
                      image:AssetImage(
                          newss.imageUrl
                      ),
                      fit: BoxFit.cover,
                    ),
                    ),
                  ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                              newss.newstitle,
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
                        Text(newss.newsdate ,style: GoogleFonts.prompt(fontSize: 12,color: Colors.black, fontWeight: FontWeight.w600,)),

                        SizedBox(
                              height: 5.0,
                            ),
                        Text(newss.description ,style: GoogleFonts.prompt(fontSize: 12,color: Colors.black)),
                        SizedBox(
                              height: 5.0,
                            ),
                        ElevatedButton(onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Searchresult()),);
                                }, child: Text("อ่านต่อ...",style: GoogleFonts.prompt(fontSize: 12,color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 87, 204, 153),
                                  minimumSize: Size(100, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                                ))
                        
                        
                      ]
                    ),
                  ),
                  ),
                  
                ],
              );
            }
          ), 
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