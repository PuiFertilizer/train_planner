import 'package:flutter/material.dart';


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
            padding: const EdgeInsets.only(right: 10),
            child:  Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )

        ]),
        body: Column(
          children: [
            Text(
              "คุณอยากเดินทางไปที่ใด", style: TextStyle(fontSize: 32),
              ) 
            ],
      ),

    );
  }
}