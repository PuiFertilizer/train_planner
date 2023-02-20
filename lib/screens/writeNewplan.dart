
// **หน้าแก้ไขแผนที่มีอยู่เดิม

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:train_planner/screens/planner.dart';
import 'package:train_planner/widgets/addTask.dart';
import 'package:train_planner/widgets/addTaskNewPlan.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/searchRouteEdit.dart';
import '../controllers/task_controllers.dart';
import '../models/task.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/searchRouteNew.dart';
import '../widgets/task_tile.dart';


// แก้ไขแผนเดิมที่มีอยู่แล้ว
class WriteNewplan extends StatefulWidget {
  const WriteNewplan({Key? key}) : super(key: key);

  @override
  _WriteNewplanState createState() => _WriteNewplanState();
}

class _WriteNewplanState extends State<WriteNewplan> {
  DateTime _selectedDate = DateTime.now();
  DateTime startDate = new DateTime(2023, 2,5);
  DateTime endDate = new DateTime(2023, 2,8);
  final _taskController = Get.put(TaskController());
  var notifyHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // ความสูงของ navbar
          child:AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 204, 153), //title หรือชื่อของแผน พิมพ์จากหน้าตั้งชื่อ
        title: Text('(ชื่อแผนการเดินทางใหม่)', style: GoogleFonts.prompt(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10), //วันเริ่มและวันสิ้นสุดของแผน
            child: Text("3 Jun. 2023 - 5 Jun. 2023", style: GoogleFonts.prompt(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,)),
          ),
          preferredSize: Size.zero),
          ),

          
      ),
      floatingActionButton: Container(
            padding: const EdgeInsets.only(bottom: 80.0, left: 60),
            height: 150.0,
            width: 150.0,
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.add),
              backgroundColor: Color.fromARGB(255, 87, 204, 153),
              onPressed: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return DialogAddPlan();
                });
              },
            ),
          ), 
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),  
          _showTasks(), //แสดงรายชื่อกิจกรรมแบบเลื่อนขึ้น-ลงได้
         SizedBox(
            height: 20,      
          ),
          

          ElevatedButton.icon(                                  
          onPressed: () async { //save แผน และกลับหน้ารวมแผน
            await Get.to(const Planner());
            _taskController.getTasks();
            },
          icon: Icon(Icons.add),
          label: Text("บันทึกแผนการเดินทาง", //สร้างแผนใหม่
          style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
          style: ElevatedButton.styleFrom(
          fixedSize: Size(350, 50),
          backgroundColor: Color.fromARGB(255, 56, 163, 165),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), 
          ),
          ),                                 
         ),
            SizedBox(
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
        padding: EdgeInsets.only(top: 0,),
        child: TaskTile(task)
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(bottom: 25,right: 25),
          child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.more_horiz),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              onPressed: () {
              _showBottomSheet(context, task);
            },
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

  _showBottomSheet(BuildContext context, Task task) { //ลบกิจกรรมออก
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4.0),
      height: MediaQuery.of(context).size.height * 0.32,
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
            onTap: () async {  //แก้ไขกิจกรรม และ save ทับ
                await Get.to(const AddTaskPage());
                _taskController.getTasks();
                //Navigator.of(context).pop();
                      },
            clr: Color.fromARGB(255, 56, 163, 165),
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
          _bottomSheetButton( 
            label: "ลบกิจกรรมออก",
            onTap: () {
              _taskController.delete(task);
              _taskController.getTasks();
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
class DialogAddPlan extends StatelessWidget{
  final _taskController = Get.put(TaskController()); //กล่องยืนยันลบแผนการเดินทาง
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height:140,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,30,10,10),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('เพิ่มกิจกรรมในแผน', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () async {
                        await Get.to(const SearchRouteNew());
                        _taskController.getTasks();
                        Navigator.of(context).pop();
                      }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      ),child: Text('เดินทางรถไฟ', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
                      SizedBox(width: 20,),

                      //กิจกรรมอื่นๆ
                      ElevatedButton(onPressed: () async {
                        await Get.to(const AddTaskNewPlanPage());
                        _taskController.getTasks();
                        Navigator.of(context).pop();
                      },style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      ), child: Text('กิจกรรมอื่นๆ', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
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


class DialogSearchRoute extends StatelessWidget{
  final _taskController = Get.put(TaskController()); //กล่องยืนยันลบแผนการเดินทาง
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height:140,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,30,10,10),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('ค้นหาเที่ยวรถไฟ', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                        //ไม่ลบ
                      }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      ),child: Text('ยกเลิก', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
                      SizedBox(width: 20,),

                      //กิจกรรมอื่นๆ
                      ElevatedButton(onPressed: () async {
                        await Get.to(const AddTaskPage());
                        _taskController.getTasks();
                        Navigator.of(context).pop();
                      },style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      ), child: Text('ค้นหา', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
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


//test swap overlay
class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  MyDialogState createState() => MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  final _taskController = Get.put(TaskController()); 
  /// When this value is false, it shows list of buttons
  /// When this value is true, it shows list of textfields
  bool isForm = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('เลือกกิจกรรม'),
      // Here, we conditionally change content
      content: isForm
          ? Stack(
              
            )
          : Stack(
              children: [
          Container(
            height:140,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,30,10,10),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('เพิ่มกิจกรรมในแผน', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        showDialog(context: context, builder: (BuildContext context) {
                         return DialogSearchRoute();
                       });
                      //Navigator.pop(context);
                      //ค้นหาเส้นทางรถไฟ
                      }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),child: Text('เดินทางรถไฟ', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
                      SizedBox(width: 20,),

                      //กิจกรรมอื่นๆ
                      ElevatedButton(onPressed: () async {
                        await Get.to(const AddTaskPage());
                        _taskController.getTasks();
                        Navigator.of(context).pop();
                      },style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 56, 163, 165),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ), child: Text('กิจกรรมอื่นๆ', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 12) ,)
                      ),
                    ],
                  ),

              ]),

            ),
          )
        ],
            ),
      actions: [
        TextButton(
          // Here isForm is switched to change the content
          onPressed: () => setState(() => isForm = !isForm),
          child: const Text('Switch'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('OK'),
        ),
      ],
    );
  }
}


