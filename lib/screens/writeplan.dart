import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:train_planner/widgets/addTask.dart';
import 'package:train_planner/widgets/button.dart';
import '../controllers/task_controllers.dart';
import '../models/task.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/task_tile.dart';

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
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),

            SizedBox(
            height: 12,
          ),
          _showTasks() //แสดงรายชื่อกิจกรรม
          
            
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

          itemBuilder: (_, index){

            Task task = _taskController.taskList[index];
            //print(task.toJson());
            if(task.date==DateFormat.yMd().format(_selectedDate)){
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                        onTap:(){
                          _showBottomSheet(context, task);
                        },
                        child: TaskTile(task)
                      )
                    ]),
                  )
                )
              );
            }else{
              return Container();
            }

              
            
        });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task){
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4.0),
        height: MediaQuery.of(context).size.height*0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              )
            ),
            Spacer(),
            
            _bottomSheetButton(
              label: "ลบกิจกรรมออก", 
              onTap: (){
                _taskController.delete(task);
                _taskController.getTasks();
                Get.back();
              },
              clr: Colors.red,
              context:context,
              ),
              SizedBox(
              height: 20,
              ),
              _bottomSheetButton(
              label: "ยกเลิก", 
              onTap: (){
                Get.back();
              },
              clr: Colors.red,
              isClose: true,
              context:context,
              ),
              SizedBox(
                height: 10,
              )
          ],
        ),

      )
    );
  }

  _bottomSheetButton({
    required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose=false,
      required BuildContext context
  }){
    return GestureDetector(
      onTap:onTap,
      child:Container(
        margin: const EdgeInsets.symmetric(vertical:4),
        height: 55,
        width: MediaQuery.of(context).size.width*0.9,
        
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color:isClose==true? Colors.black:clr
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose==true?Colors.black:clr,
        ),

        child: Center(
          child: Text(
            label,
            style: isClose?titleStyle:titleStyle.copyWith(color: Colors.white),
          ),
        ),
      )
    );
  }

 TextStyle get titleStyle{
  return GoogleFonts.prompt(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color:Colors.white
    )
  );
 }

}