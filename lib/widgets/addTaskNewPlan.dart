import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/controllers/task_controllers.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/input_field.dart';

import '../models/task.dart';
import '../screens/writeNewplan.dart';


// เพิ่มกิจกรรมอื่นหน้าแก้ไข
class AddTaskNewPlanPage extends StatefulWidget {
  const AddTaskNewPlanPage({Key? key}) : super(key: key);

  @override
  State<AddTaskNewPlanPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskNewPlanPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime= "เลือกเวลา";
  String _startTime = "เลือกเวลา";
  String _selectedAttraction = 'ไม่ระบุสถานที่';
  List<String> attractionList=[
    'หาดนํ้าใส','หาดนางรำ','ท่าเรือจุกเสม็ด','หาดนํ้าใส','หาดนางรำ','ท่าเรือจุกเสม็ด'
  ];
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
                'เพิ่มกิจกรรมเพื่อสร้างแผนใหม่',style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),
              ),
              MyInputField(title: 'คำอธิบาย', hint: 'ระบุที่นี่', controller: _titleController,),
              MyInputField(title: 'สถานที่', hint: _selectedAttraction,
              widget: DropdownButton(
                icon:Icon(Icons.keyboard_arrow_down,
                color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                underline: Container(height: 0,),
                onChanged: (String? newValue){
                  setState(() {
                    _selectedAttraction = (newValue!);
                  });
                },
                items: attractionList.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString())
                  );
                }
                ).toList(),
                //style: subTitleStyle,
              ),
              ),
              MyInputField(title: 'วันที่ต้องการเพิ่มกิจกรรม', hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon:Icon(Icons.calendar_today_outlined, color: Colors.grey,),
                onPressed: (){
                  _getDateFromUser();
              }),),
              Row(children: [
                Expanded(
                  child: MyInputField(
                    title:"เวลาเริ่ม",
                    hint:  _startTime,
                    widget: IconButton(
                      onPressed: (){
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: MyInputField(
                    title:"เวลาสิ้นสุด",
                    hint:  _endTime,
                    widget: IconButton(
                      onPressed: (){
                        _getTimeFromUser(isStartTime: false);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
                
              ],),
              SizedBox(height: 18,),
              ElevatedButton.icon(                                  
          onPressed: ()  {
            _addTaskToDb();
            Navigator.push(context, MaterialPageRoute(builder: (context) => WriteNewplan()),); //ยืนยันการเพิ่ม
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
      title: _titleController.text,
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