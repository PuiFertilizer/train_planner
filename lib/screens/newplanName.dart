import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/controllers/task_controllers.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/input_field.dart';

import '../models/task.dart';

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
                'เพิ่มกิจกรรมอื่นๆ',style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
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
                    title:"เวลาสิ้นสุด",
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
           // Navigator.push(context, MaterialPageRoute(builder: (context) => newplanPage()),);// ///
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
}