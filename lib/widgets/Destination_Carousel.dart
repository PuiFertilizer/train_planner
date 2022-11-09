
import 'package:flutter/material.dart';

import '../models/destination_model.dart';

class Destination_Carousel extends StatelessWidget {
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
                'จุดหมายยอดนิยม',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ]),
        
        ),
        Container(height: 290.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            Destination destination = destinations[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 210.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  bottom: 15.0,
                child: Container(
                  height: 120.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  //Padding
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${destination.activities.length} activities',style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.2,)),
                      Text(destination.description,
                      style: TextStyle(
                        color: Colors.grey,
                      ),),
                    ],
                  ),
                )

                ),
            ),

                Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                      ),
                    ]),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            height: 180.0, 
                            width: 180.0, 
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column( //wra[]
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(destination.city,
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              )
                              ),
                          Row(
                            children: <Widget>[
                            SizedBox(width: 5.0,),
                            Text(
                              destination.country,
                                style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                            )),
                            ],
                            ),
                          ],),
                        )
                      ],
                    ),
                )

              ],
            ),
          );
            },
          ),
        
        )
      ]
    );
  }
}