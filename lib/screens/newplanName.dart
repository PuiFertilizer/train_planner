import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/controllers/task_controllers.dart';
import 'package:train_planner/screens/planner.dart';
import 'package:train_planner/screens/writeplan.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/input_field.dart';
import 'package:train_planner/widgets/searchRouteNew.dart';

import '../models/task.dart';
import '../widgets/addTask.dart';
import '../widgets/addTaskNewPlan.dart';
import '../widgets/searchRouteEdit.dart';

//สร้างแผนการเดินทางใหม่ ตั้งชื่อแผน เวลาเริ่ม-สิ้นสุด
class newplanPage extends StatefulWidget{
  const newplanPage({Key? key}) : super(key: key);

  @override
  State<newplanPage> createState() => _newplanPageState();
}

class _newplanPageState extends State<newplanPage>{
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endDate= "เลือกเวลา";
  String _startDate = "เลือกเวลา";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left:20, right: 20, top:20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'สร้างแผนการเดินทางใหม่',style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),
              ),
              MyInputField(title: 'ตั้งชื่อการเดินทาง (ไม่เกิน 50 ตัวอักษร)', hint: 'ระบุที่นี่', controller: _titleController,),
              Row(children: [
                Expanded(
                  child: MyInputField(
                    title:"วันเริ่มต้นแผน",
                    hint:  DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                    icon:Icon(Icons.calendar_today_outlined, color: Colors.grey,),
                    onPressed: (){
                    _getDateFromUser();
                }),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: MyInputField(
                    title:"วันสิ้นสุดแผน",
                    hint:  DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                      icon:Icon(Icons.calendar_today_outlined, color: Colors.grey,),
                    onPressed: (){
                    _getDateFromUser();
                }),
                  ),
                ),
                
              ],),
              SizedBox(height:30),
              ElevatedButton.icon(
                                    
             onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Writeplan()),); //ไปที่หน้าแผนการเดินทางที่สร้างใหม่ที่ว่าง พร้อม id ใหม่
               },
          icon: Icon(Icons.add),
          label: Text("เพิ่มแผนการเดินทาง", //สร้างแผนใหม่
          style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
          style: ElevatedButton.styleFrom(
          fixedSize: Size(350, 50),
          backgroundColor: Color.fromARGB(255, 56, 163, 165),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), 
          ),
          ),
                                    
         ),
            ],
          ),
        ),
      ),
      
    );
  }
  _appBar(BuildContext context){ //แถบด้านบน
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 56, 163, 165),
      leading: GestureDetector(
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Planner()));
        },
        child: Icon(Icons.arrow_back_ios,
        size:20,
        ),
      ),
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
       firstDate: DateTime(2015), lastDate: DateTime(2121)
    );

    if (_pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });     
    }else{
      print("it's null or something wrong");
    }
  }
}

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
