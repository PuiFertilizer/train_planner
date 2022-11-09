import 'package:flutter/material.dart';

import '../widgets/Destination_Carousel.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 204, 153),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child:  Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )

        ]),
        body: Stack(
          

          children: [
            Image.asset("assets/images/tachompoo.jpg",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
            Column(
              

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                  "คุณอยากเดินทางไปที่ใด",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    )
                ),
                    ],
                  )
                
            ),
              ],
            ),
            Positioned.fill(

              bottom: 310,
              child: Align(
                alignment: Alignment.center,
              child: Container(
                width: 340,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(199, 249, 204, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
                
                
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 200.0) ,
              
                
                
                     // Destination_Carousel(),
                    ],
                  ),
                ),
              ),
              
            ),
           
          ),  
             
          Column(
            
            children: <Widget>[
              SizedBox(height: 300.0) ,
              
                
                
                    Destination_Carousel(),
                  
              
              
            ],
          )  
        ],          
      ),
    );
    
  }
  
}