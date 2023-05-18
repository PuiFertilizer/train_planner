import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../theme.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //กล่องสีเทาแสดงรายชื่อกิจกรรมของแผน
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 207, 207, 207),
          ),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title ?? "",
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        color: Color.fromARGB(255, 24, 24, 24),
                        size: 25,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${task!.startTime} - ${task!.endTime}", //เวลาเริ่มและเวลาสิ้นสุด
                        style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 24, 24, 24))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 24, 24, 24),
                        size: 25,
                      ),
                      Text(
                        task?.date ?? "", //วันที่ของแผน
                        style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 24, 24, 24))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_location_alt,
                        color: Color.fromARGB(255, 24, 24, 24),
                        size: 25,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        task?.attraction ?? "",
                        style: GoogleFonts.prompt(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 24, 24, 24))),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
