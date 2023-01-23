import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
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
                'เพิ่มกิจกรรมอื่นๆ',style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),
              ),
              MyInputField(title: 'คำอธิบาย', hint: 'ระบุที่นี่'),
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
                
              ],)
            ],
          ),
          )
      )
    );
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