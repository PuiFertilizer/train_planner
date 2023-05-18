import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:train_planner/db/db_helper.dart';
import 'package:train_planner/widgets/addtask.dart';
import 'package:train_planner/widgets/search_route_edit.dart';
import '../controllers/task_controllers.dart';
import '../models/plan.dart';
import '../models/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../widgets/task_tile.dart';

// แก้ไขแผนเดิมที่มีอยู่แล้ว
class Writeplan extends StatefulWidget {
  const Writeplan({Key? key, required this.planid}) : super(key: key);
  final int planid;
  @override
  State<Writeplan> createState() => _WriteplanState();
}

class _WriteplanState extends State<Writeplan> {
  late TaskController _taskController;
  //var notifyHelper;

  @override
  void dispose() {
    //print("dispose");
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _taskController = TaskController(widget.planid);
    _taskController.getTasks(widget.planid);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // ความสูงของ navbar
        child: FutureBuilder(
          future: DBHelper.getPlan(widget.planid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Plan plan = Plan.fromJson(snapshot.data![0]);
              return AppBar(
                backgroundColor: const Color.fromARGB(
                    255, 87, 204, 153), //title หรือชื่อของแผน
                title: Text(plan.name,
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )), //title ของแผนการเดินทาง
                centerTitle: true,
                bottom: const PreferredSize(
                    preferredSize: Size.zero,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10, left: 10), //วันเริ่มและวันสิ้นสุดของแผน
                    )),
              );
            } else {
              return AppBar(
                backgroundColor: const Color.fromARGB(
                    255, 87, 204, 153), //title หรือชื่อของแผน
                title: Text(' ',
                    style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )), //title ของแผนการเดินทาง
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: Size.zero,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10), //วันเริ่มและวันสิ้นสุดของแผน
                      child: Text(" ",
                          style: GoogleFonts.prompt(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )), //วันที่ของแผน
                    )),
              );
            }
          },
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 80.0, left: 60),
        height: 150.0,
        width: 150.0,
        child: FloatingActionButton(
          heroTag: null,
          backgroundColor: const Color.fromARGB(255, 87, 204, 153),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogAddPlan(
                    planid: widget.planid,
                    taskController: _taskController,
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          _showTasks(), //แสดงรายชื่อกิจกรรมแบบเลื่อนขึ้น-ลงได้
          const SizedBox(
            height: 20,
          ),

          ElevatedButton.icon(
            onPressed: () {
              //save แผน และกลับหน้ารวมแผน
              Navigator.pop(context);
            },
            icon: const Icon(Icons.add),
            label: Text(
              "บันทึกแผนการเดินทาง", //สร้างแผนใหม่
              style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              backgroundColor: const Color.fromARGB(255, 56, 163, 165),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  //function แสดงรายชื่อกิจกรรมของแผนจาก database
  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];

              //print(task.toJson());
              // if (task.date == DateFormat.yMd().format(_selectedDate)) {   //เงื่อนไขวันที่
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 0,
                            ),
                            child: TaskTile(task)),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 60,
                            padding:
                                const EdgeInsets.only(bottom: 25, right: 25),
                            child: FloatingActionButton(
                              elevation: 0,
                              heroTag: null,
                              backgroundColor:
                                  const Color.fromARGB(255, 207, 207, 207),
                              onPressed: () {
                                _showBottomSheet(context, task);
                              },
                              child: const Icon(Icons.more_horiz,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  )));
              // } else {
              //   return Container();
              // }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    //ลบกิจกรรมออก
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4.0),
      height: MediaQuery.of(context).size.height * 0.40,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              height: 6,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              )),
          const Spacer(),
          _bottomSheetButton(
            label: "แก้ไขกิจกรรม",
            onTap: () async {
              //แก้ไขกิจกรรม และ save ทับ
              _taskController.getTasks(widget.planid);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskPage(
                      planid: widget.planid,
                    ),
                  ));
            },
            clr: const Color.fromARGB(255, 56, 163, 165),
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
          _bottomSheetButton(
            label: "ลบกิจกรรมออก",
            onTap: () {
              _taskController.delete(task);
              _taskController.getTasks(widget.planid);
              Get.back();
            },
            clr: Colors.red,
            context: context,
          ),
          const SizedBox(
            height: 30,
          ),
          _bottomSheetButton(
            label: "ยกเลิก",
            onTap: () {
              Get.back();
            },
            clr: Colors.red,
            isClose: true,
            context: context,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ));
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: isClose == true ? Colors.black : clr),
            borderRadius: BorderRadius.circular(20),
            color: isClose == true ? Colors.black : clr,
          ),
          child: Center(
            child: Text(
              label,
              style: isClose
                  ? titleStyle
                  : titleStyle.copyWith(color: Colors.white),
            ),
          ),
        ));
  }

  TextStyle get titleStyle {
    return GoogleFonts.prompt(
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white));
  }
}

//class SimpleDialog
class DialogAddPlan extends StatelessWidget {
  final TaskController taskController;
  final int planid;
  const DialogAddPlan(
      {super.key,
      required this.planid,
      required this.taskController}); //กล่องยืนยันลบแผนการเดินทาง
  @override
  Widget build(BuildContext context) {
    //taskController = Get.put(TaskController(planid));
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'เพิ่มกิจกรรมในแผน',
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
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchRouteEdit(
                                  planid: planid,
                                ),
                              ));
                          taskController.getTasks(planid);
                          //Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 56, 163, 165),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                        ),
                        child: Text(
                          'เดินทางรถไฟ',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                    const SizedBox(
                      width: 20,
                    ),

                    //กิจกรรมอื่นๆ
                    ElevatedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskPage(
                                  planid: planid,
                                ),
                              ));
                          taskController.getTasks(planid);
                          //Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 56, 163, 165),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                        ),
                        child: Text(
                          'กิจกรรมอื่นๆ',
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.bold, fontSize: 12),
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
