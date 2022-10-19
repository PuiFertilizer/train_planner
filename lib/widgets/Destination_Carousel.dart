
import 'package:flutter/material.dart';

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
        Container(height: 250.0,
        color: Colors.blue,)
      ]
    );
  }
}