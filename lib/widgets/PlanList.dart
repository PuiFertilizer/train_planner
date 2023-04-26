import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_planner/db/db_helper.dart';
import 'package:train_planner/models/plan.dart';
import 'package:train_planner/screens/writeplan.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/newplanName.dart';

class PlanList extends StatelessWidget {
  const PlanList({super.key});
  @override
  Widget build(BuildContext context) {
    late List<Map<String, dynamic>> planns;

    return FutureBuilder(
        future: DBHelper.queryPlan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            planns = snapshot.data!;
            return Column(
              children: <Widget>[
                SizedBox(
                  height: context.mediaQuery.size.height * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: planns.length, //itemcount คือจำนวนแผนทั้งหมด
                      itemBuilder: (BuildContext context, int index) {
                        Plan plann = Plan.fromJson(
                            planns[index]); //index เรียงตามชื่อแผน
                        // var date = DBHelper.getPlanDate(plann.id!);
                        //var firstDay = "no date";
                        //var lastDay = "";
                        /*if (date.isNotEmpty) {
                          firstDay = date.first.toString();
                          lastDay = date.last.toString();
                        }*/
                        return Stack(
                          children: <Widget>[
                            //widget คือจำนวนกล่องข้อความ
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  40.0, 10.0, 40.0, 5.0),
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              plann.name, //ชื่อของแผน
                                              style: GoogleFonts.prompt(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              softWrap: false,
                                              maxLines: 3,
                                              overflow:
                                                  TextOverflow.ellipsis, // new
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      /*Text("$firstDay - $lastDay",
                                          style: GoogleFonts.prompt(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),*/
                                    ]),
                              ),
                            ),
                            Positioned(
                              //popup ของ 3 dots
                              right: 40.0,
                              top: 80.0,
                              bottom: 10.0,
                              child: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      leading: const Icon(
                                        CupertinoIcons.pencil,
                                      ),
                                      title: Text(
                                        'แก้ไข',
                                        style: GoogleFonts.prompt(),
                                      ),
                                    ), //ไปที่หน้าแก้ไข
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: ListTile(
                                      leading: const Icon(
                                        CupertinoIcons.delete,
                                      ),
                                      title: Text(
                                        'ลบแผน',
                                        style: GoogleFonts.prompt(),
                                      ),
                                      iconColor: Colors.white,
                                      tileColor: Colors.red,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                                onSelected: (int menu) {
                                  if (menu == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Writeplan(
                                                planid: plann.id!.toInt(),
                                              )),
                                    );
                                  } else if (menu == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DeleteDialog(
                                            plan: plann,
                                          );
                                        });
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewplanPage()),
                    ); //
                  },
                  icon: const Icon(Icons.add),
                  label: Text(
                    "สร้างแผนการเดินทางใหม่", //สร้างแผนใหม่
                    style:
                        GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50),
                    backgroundColor: const Color.fromARGB(255, 56, 163, 165),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.plan});
  final Plan plan;
  //กล่องยืนยันลบแผนการเดินทาง
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'คุณต้องการลบแผนการเดินทางหรือไม่',
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          DBHelper.deletePlan(plan);
                          Navigator.of(context).pop();
                          //ลบ
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                        ),
                        child: Text(
                          'ใช่',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //ไม่ลบ
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 56, 163, 165),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                        ),
                        child: Text(
                          'ไม่',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
