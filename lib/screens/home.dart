import 'package:flutter/material.dart';

//import 'package:train_planner/widgets/Tourtrain_Carousel.dart';

import '../widgets/Destination_Carousel.dart';

import '../widgets/Tourtrain_Carousel.dart';



class HomePage extends StatelessWidget {
  int _selectedIndex = 0;
  int _currentTab = 0;

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
        body: Container(
          child: SingleChildScrollView(
            child: Stack(

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

              bottom: 480,
              child: Align(
                alignment: Alignment.center,
              child: Container(
                width: 340,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 221),
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
              SizedBox(height: 350.0) ,
              Destination_Carousel(),
              SizedBox(height: 10.0) ,
              Tourtrain_Carousel()

                  
                  
              
              
            ],
          ) ,
           
        ],  
          ),
        ),        
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Color.fromARGB(255, 0, 204, 153),
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30.0,
          ),label: 'หน้า'
          
          
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 30.0,
          ),label: 'รายการโปรด'
          
        ),
        
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 30.0,
          ),label: 'แผนเดินทาง'
          
        ),
      ]
      ),
    );
    
  }
  
}

void setState(Null Function() param0) {
}