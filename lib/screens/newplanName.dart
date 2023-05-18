import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_planner/db/db_helper.dart';
import 'package:train_planner/screens/planner.dart';
import 'package:train_planner/widgets/input_field.dart';

//สร้างแผนการเดินทางใหม่ ตั้งชื่อแผน เวลาเริ่ม-สิ้นสุด
class NewplanPage extends StatefulWidget {
  const NewplanPage({Key? key}) : super(key: key);

  @override
  State<NewplanPage> createState() => _NewplanPageState();
}

class _NewplanPageState extends State<NewplanPage> {
  final TextEditingController _titleController = TextEditingController();
  //final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'สร้างแผนการเดินทางใหม่',
                style: GoogleFonts.prompt(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyInputField(
                title: 'ตั้งชื่อการเดินทาง (ไม่เกิน 50 ตัวอักษร)',
                hint: 'ระบุที่นี่',
                controller: _titleController,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  DBHelper.newPlan(_titleController.text).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Planner(),
                        ));
                  }); //ไปที่หน้าแผนการเดินทางที่สร้างใหม่ที่ว่าง พร้อม id ใหม่
                },
                icon: const Icon(Icons.add),
                label: Text(
                  "เพิ่มแผนการเดินทาง", //สร้างแผนใหม่
                  style:
                      GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 50),
                  backgroundColor: const Color.fromARGB(255, 56, 163, 165),
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

  _appBar(BuildContext context) {
    //แถบด้านบน
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 56, 163, 165),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
    );
  }

  /*_getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });
    } else {
      print("it's null or something wrong");
    }
  }*/
}
