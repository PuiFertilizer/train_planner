import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/controllers/task_controllers.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/input_field.dart';
import 'package:train_planner/widgets/input_field_disabled.dart';

import '../models/task.dart';
import '../screens/writeplan.dart';


// เพิ่มกิจกรรมอื่นหน้าแก้ไข
class AddResultPage extends StatefulWidget {
  const AddResultPage({Key? key}) : super(key: key);

  @override
  State<AddResultPage> createState() => _AddResultPageState();
}

class _AddResultPageState extends State<AddResultPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();            //วันเดินทาง
  String _description = "โดยสารรถไฟขบวนรถธรรมดา 261"; //ขบวน
  String _endTime= "09:20"; //เวลารถออก
  String _startTime = "14:15"; //เวลาถึง

  String _selectedAttraction = 'กรุงเทพ - หัวหิน'; //ต้นทาง - ปลายทาง
  
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
                'ยืนยันผลการค้นหาที่เลือก',style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),
              ),
              MyInputFieldDisabled(title: 'คำอธิบาย', hint: _description ),
              MyInputFieldDisabled(title: 'ต้นทาง - ปลายทาง', hint: _selectedAttraction ),
              MyInputFieldDisabled(title: 'วันเดินทาง', hint: DateFormat.yMd().format(_selectedDate) ),
              
              Row(children: [
                Expanded(
                  child: MyInputFieldDisabled(title: 'เวลารถออก', hint: _startTime ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: MyInputFieldDisabled(title: 'เวลาถึง', hint: _startTime ),
                ),
                
              ],),
              SizedBox(height: 18,),
              ElevatedButton.icon(                                  
          onPressed: ()   {
            _addTaskToDb();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Writeplan()),); //ยืนยันการเพิ่ม
            _taskController.getTasks();
          },
          icon: Icon(Icons.add),
          label: Text("ยืนยันการเพิ่ม", //สร้างแผนใหม่
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
          )
      )
    );
  }

  _validateData(){
    if(_titleController.text.isNotEmpty){
      //add to database
      _addTaskToDb();
      Get.back();
    }else if(_titleController.text.isEmpty){
      Get.snackbar("Required", "All fields are required!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      icon:Icon(Icons.warning_amber_rounded));
    }
  }

  _addTaskToDb() async{
    int value = await _taskController.addTask(
      task: Task(
      title: _description,
      attraction: _selectedAttraction,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
    )
    );
    print("My id is"+" $value");
  }

  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 56, 163, 165),
      leading: GestureDetector(
        onTap:(){
          Get.back();
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

  _getTimeFromUser({required bool isStartTime}) async{
    var pickedTime = await _showTimePicker();
    var df = DateFormat("h:mm a");
    var dt = df.parse(pickedTime!.format(context));
    var _formattedTime = DateFormat('HH:mm').format(dt); //แก้เวลา
    if(pickedTime==null){
      print("Time Cancelled");
    }else if(isStartTime==true){
      setState(() {
        _startTime = _formattedTime;
      });
    }else if(isStartTime==false){
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker(){
    return showTimePicker(
      context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 24-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
              child: childWidget!);
}
    );
  }
}