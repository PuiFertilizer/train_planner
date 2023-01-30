import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../theme.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
      padding: EdgeInsets.all(16),
      // width: SizeConfig.screenWidth * 0.78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.green,
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task?.title??"",
                style: GoogleFonts.prompt(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(height:12 ,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.grey[200],
                    size: 18,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    "${task!.startTime} - ${task!.endTime}",
                    style: GoogleFonts.prompt(
                      textStyle: 
                      TextStyle(fontSize: 13, color: Colors.grey[100])
                    ),
                  ),
                  

                ],
              ),
              SizedBox(height: 12,),
                  Text(
                    task?.attraction??"",
                    style: GoogleFonts.prompt(
                      textStyle: TextStyle(fontSize: 15, color: Colors.grey[100])
                    ),
                  ),

            ],
          ),
        )
      ]),
      )
    );
  }
}