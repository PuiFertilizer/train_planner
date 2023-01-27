import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:train_planner/widgets/addTask.dart';
import 'package:train_planner/widgets/button.dart';
import '../controllers/task_controllers.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Writeplan extends StatefulWidget {
  const Writeplan({ Key? key }) : super(key: key);

  @override
  _WriteplanState createState() => _WriteplanState();
}

class _WriteplanState extends State<Writeplan> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('สร้างแผนการเดินทางใหม่', style: GoogleFonts.prompt(color: Colors.black),),       
      ),
      body: Column(
        children: <Widget>[       
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('สร้างแผนการเดินทางใหม่', style: GoogleFonts.prompt(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),),
                      Text('ตั้งชื่อการเดินทาง (ไม่เกิน 50 ตัว)', style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                          fontWeight: FontWeight.bold,),),  
                      Container(
                        height: 50,
                        width: 350,

                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 219, 219),
                          border: Border.all(
                            color: Color.fromARGB(255, 219, 219, 219),
                            width: 1.0
                          ),
                          //borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Row(children: [
                          Expanded(child: 
                            TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'ระบุชื่อแผน',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    //color: context.theme.backgroundColor
                                    width: 0
                                  )
                                ),

                              ),

                              
                            )
                          )
                        ]),
                      ),
                      SizedBox(height: 18,),
                      MyButton(
                        label: 'เพิ่มกิจกรรม', onTap: ()async{
                          await Get.to(AddTaskPage());
                          _taskController.getTasks();
                          }) 
                    ],
                  ),
                )
              ]
            ),
            ),
            Container(
              child: DatePicker(
                DateTime.now(),
                height: 80,
                width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: Color.fromARGB(255, 255, 0, 0),
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                monthTextStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                   color: Colors.grey

                  )
                ),
                onDateChange: (date){
                  _selectedDate = date;
                },
              ),
            ),

            SizedBox(
            height: 12,
          ),
          _showTasks()
          
            
        ],

      ),
    );
  }


  //function แสดงรายชื่อกิจกรรมของแผนจาก database
  _showTasks(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, context){
            print(_taskController.taskList.length);
            return Container(
              width: 100,
              height: 50,
              color: Colors.green,
              margin: const EdgeInsets.only(bottom:10),
            );
        });
      }),
    );
  }

}