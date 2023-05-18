import 'package:flutter/material.dart';
import '../models/destination_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/stationdetails.dart';

class Destination_Carousel extends StatelessWidget {
  const Destination_Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'จุดหมายแนะนำ',
                style: GoogleFonts.prompt(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
      SizedBox(
        //color: Colors.blue,
        height: 240.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            Destination destination = destinations[index];
            return Container(
              margin: const EdgeInsets.all(10.0),
              width: 210.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 15.0,
                    child: Container(
                        height: 205.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            //ทำเงาดำ
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 10.0,
                              ),
                            ]),

                        //Padding
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(destination.city,
                                  style: GoogleFonts.prompt(
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                  )),
                              Text(
                                'สถานี${destination.description}',
                                style: GoogleFonts.prompt(
                                  color: const Color.fromARGB(255, 80, 80, 80),
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StationDetails(
                                      station: destination.description,
                                    )));
                      },
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              height: 140.0,
                              width: 200.0, //200
                              image: AssetImage(destination.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              //wra[]
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: const <Widget>[
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    ]);
  }
}
