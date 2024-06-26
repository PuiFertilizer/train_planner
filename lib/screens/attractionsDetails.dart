import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/stationdatalist.dart';

//รายละเอียดแต่ละสถานที่
class AttractionsDetails extends StatefulWidget {
  final Destination destination;

  const AttractionsDetails({super.key, required this.destination});

  @override
  State<AttractionsDetails> createState() => _AttractionsDetailsState();
}

class _AttractionsDetailsState extends State<AttractionsDetails> {
  //favourite
  bool _isFavourited = false;
  //int _favouriteCount = 0;

  //change colors of favourite
  void _toggleFavourite() {
    setState(() {
      //สถานะรายการโปรด
      if (_isFavourited) {
        //_favouriteCount -= 1;
        _isFavourited = false; //ไม่ชอบ
      } else {
        //_favouriteCount += 1;
        _isFavourited = true; //ชอบ
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 204, 153),
        //title: Text('ผลการค้นหาเพิ่มในแผน', style: GoogleFonts.prompt(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //ชื่อสถานที่
                  Text(
                    'รายละเอียดสถานที่',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    //หัวใจรายการโปรด
                    children: const <Widget>[],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 5,
              color: const Color.fromARGB(255, 128, 237, 153),
            ),
          ),
          Container(
            height: 15,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover,
                      )),
                ),
              )
            ],
          ),
          Container(
            height: 10,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          Container(
            height: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //ชื่อสถานที่
                  Text(
                    widget.destination.locationName,
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    //หัวใจรายการโปรด
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.centerRight,
                          icon: (_isFavourited
                              ? const Icon(
                                  Icons.favorite,
                                  size: 40.0,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  size: 40.0,
                                )),
                          color: Colors.red[500],
                          //to call _toggleFavourite
                          onPressed: _toggleFavourite,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่
                  Image.asset(
                    'assets/images/description.png',
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'คำอธิบายโดยย่อ',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่
                  Text(
                    widget.destination.description,
                    maxLines: 6,
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่
                  Image.asset(
                    'assets/images/walking.png',
                    height: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'วิธีไปจากสถานี',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่

                  Expanded(
                    child: Text(
                      widget.destination.howtotravel,
                      style: GoogleFonts.prompt(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่
                  Image.asset(
                    'assets/images/map.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'พิกัดที่ตั้ง',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ชื่อสถานที่

                  Expanded(
                    child: Text(
                      widget.destination.locationaddress,
                      style: GoogleFonts.prompt(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
