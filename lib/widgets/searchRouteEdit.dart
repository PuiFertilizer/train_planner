import 'package:date_format/date_format.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/controllers/task_controllers.dart';
import 'package:train_planner/widgets/button.dart';
import 'package:train_planner/widgets/input_field.dart';
import 'package:train_planner/widgets/searchresultPlan.dart';

import '../models/task.dart';
import '../screens/searchresult.dart';

//ใส่ข้อมูลค้นหาเส้นทางของหน้าแก้ไขแผน

class SearchRouteEdit extends StatefulWidget {
  const SearchRouteEdit({Key? key}) : super(key: key);

  @override
  State<SearchRouteEdit> createState() => _SearchRouteEditState();
}

class _SearchRouteEditState extends State<SearchRouteEdit> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime= "เลือกเวลา";
  String _startTime = "เลือกเวลา";
  String _selectedAttraction = 'ไม่ระบุสถานที่';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.train,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 40,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    "สถานีต้นทาง",
                    style: GoogleFonts.prompt(
                    textStyle: TextStyle(fontSize: 16, color: Color.fromARGB(255, 24, 24, 24))
                    ),
                  ), 
                  SizedBox(width: 0,),               
                ],
              ),
             SizedBox(height: 5,),
             DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: [
                //เอามาจากรายชื่อสถานีใน Database
                'กรุงเทพ ',
                'บ้านพลูตาหลวง ',
                'เชียงใหม่  ',
                'หนองคาย  ',
                'อุบลราชธานี  ',
                'สุราษฎร์ธานี ',
                'ชุมทางหาดใหญ่ ',
                'ชุมทางฉะเชิงเทรา',
                'ปราจีนบุรี'
              ],
              dropdownSearchDecoration: InputDecoration(
                
                hintText: "  สถานีหรือชื่อจังหวัด",
                enabledBorder: 
                OutlineInputBorder(                                           
                borderSide: const BorderSide(
                  color: Colors.grey, width: 2),
                borderRadius:
                BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                color: Colors.white, width: 2),
                borderRadius:
                  BorderRadius.circular(10.0),
                ),
                contentPadding:
                const EdgeInsets.symmetric(
                vertical: 4.0),
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromARGB(
                255, 255, 255, 255),

              ),
              onChanged: itemSelectionChanged,
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.red,
              )
            ),
            SizedBox(height: 20,),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_location_alt,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 40,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    "สถานีปลายทาง",
                    style: GoogleFonts.prompt(
                    textStyle: TextStyle(fontSize: 16, color: Color.fromARGB(255, 24, 24, 24))
                    ),
                  ), 
                  SizedBox(width: 0,),               
                ],
              ),
             SizedBox(height: 5,),
             DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: [
                //เอามาจากรายชื่อสถานีใน Database
                'กรุงเทพ ',
                'บ้านพลูตาหลวง ',
                'เชียงใหม่ ',
                'หนองคาย ',
                'อุบลราชธานี ',
                'สุราษฎร์ธานี ',
                'ชุมทางหาดใหญ่ ',
                'ชุมทางฉะเชิงเทรา',
                'ปราจีนบุรี'
              ],
              dropdownSearchDecoration: InputDecoration(
                
                hintText: "  สถานีหรือชื่อจังหวัด",
                enabledBorder: 
                OutlineInputBorder(                                           
                borderSide: const BorderSide(
                  color: Colors.grey, width: 2),
                borderRadius:
                BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                color: Colors.white, width: 2),
                borderRadius:
                  BorderRadius.circular(10.0),
                ),
                contentPadding:
                const EdgeInsets.symmetric(
                vertical: 4.0),
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromARGB(
                255, 255, 255, 255),

              ),
              onChanged: itemSelectionChanged2,
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.red,
              )
            ),
            SizedBox(height: 20,),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Color.fromARGB(255, 24, 24, 24),
                    size: 35,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "วันเดินทาง",
                    style: GoogleFonts.prompt(
                    textStyle: TextStyle(fontSize: 16, color: Color.fromARGB(255, 24, 24, 24))
                    ),
                  ), 
                  SizedBox(width: 0,),               
                ],
              ),
              SizedBox(height: 5,),
              TextField(
                  controller: _date,
                  decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey, width: 2),
                  borderRadius:
                    BorderRadius.circular(10.0)),
                 contentPadding:
                 const EdgeInsets.symmetric(vertical: 4.0),
                 filled: true, //<-- SEE HERE
                 fillColor: Color.fromARGB(255, 255, 255, 255),
                 //icon: const Icon(Icons.calendar_today_rounded),
                 ),
                onTap: () async {
                  DateTime? pickeddate =
                  await showDatePicker(
                   context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime(2000),
                   lastDate: DateTime(2101));
                  if (pickeddate != null) {
                    setState(() {
                      _date.text =
                        DateFormat('dd/MM/yyyy').format(pickeddate);
                         });
                        }
                      },
              ),
              SizedBox(height: 10,),
              ElevatedButton.icon(
                 onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                       SearchresultPlan()),
                    ); //ไปที่หน้าผลการค้นหา
                    }, //มีการ Query
                    icon: const Icon(Icons.search),
                    label: Text(
                      "ค้นหา",
                    style: GoogleFonts.prompt(
                      color: Colors.white,
                      fontSize: 20.0),
                      ),
                      style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 40),
                      backgroundColor:
                      Color.fromARGB(255, 56, 163, 165),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15.0),
                      ),
                        ),
                      ),

          ],
        ),
      ),
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

  

  void itemSelectionChanged(String? originStation) {
    print('items');
    print(originStation); //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
  }

  void itemSelectionChanged2(String? destinationStation) {
    print('items');
    print(destinationStation); //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
  }
 
}