import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/widgets/searchresultPlan.dart';

import '../db/datalist.dart';

//ใส่ข้อมูลค้นหาเส้นทางของหน้าแก้ไขแผน

//need edit

class SearchRouteEdit extends StatefulWidget {
  const SearchRouteEdit({Key? key, required this.planid}) : super(key: key);
  final int planid;

  @override
  State<SearchRouteEdit> createState() => _SearchRouteEditState();
}

class _SearchRouteEditState extends State<SearchRouteEdit> {
  final TextEditingController _date = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String origin = "";
  String destination = "";

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
                const Icon(
                  Icons.train,
                  color: Color.fromARGB(255, 24, 24, 24),
                  size: 40,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "สถานีต้นทาง",
                  style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 24, 24, 24))),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: stationList,
              dropdownSearchDecoration: InputDecoration(
                hintText: "  สถานีหรือชื่อจังหวัด",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onChanged: itemSelectionChanged,
              showSearchBox: true,
              searchFieldProps: const TextFieldProps(
                cursorColor: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_location_alt,
                  color: Color.fromARGB(255, 24, 24, 24),
                  size: 40,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "สถานีปลายทาง",
                  style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 24, 24, 24))),
                ),
                const SizedBox(
                  width: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItems: true,
                items: stationList,
                dropdownSearchDecoration: InputDecoration(
                  hintText: "  สถานีหรือชื่อจังหวัด",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onChanged: itemSelectionChanged2,
                showSearchBox: true,
                searchFieldProps: const TextFieldProps(
                  cursorColor: Colors.red,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Color.fromARGB(255, 24, 24, 24),
                  size: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "วันเดินทาง",
                  style: GoogleFonts.prompt(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 24, 24, 24))),
                ),
                const SizedBox(
                  width: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: _date,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                filled: true, //<-- SEE HERE
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                //icon: const Icon(Icons.calendar_today_rounded),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (pickeddate != null) {
                  setState(() {
                    _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                    _selectedDate = pickeddate;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchresultPlan(
                            date: _selectedDate.toString(),
                            destination: destination,
                            source: origin,
                            planid: widget.planid,
                          )),
                ); //ไปที่หน้าผลการค้นหา
              }, //มีการ Query
              icon: const Icon(Icons.search),
              label: Text(
                "ค้นหา",
                style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(90, 40),
                backgroundColor: const Color.fromARGB(255, 56, 163, 165),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 56, 163, 165),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
    );
  }

  void itemSelectionChanged(String? originStation) {
    if (kDebugMode) {
      print('items');
      print(originStation);
      //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
    }
    origin = originStation!;
  }

  void itemSelectionChanged2(String? destinationStation) {
    if (kDebugMode) {
      print('items');
      print(destinationStation);
      //เมื่อเลือกระบบจะเลือก items ออกมาเป็นค่า s
    }
    destination = destinationStation!;
  }
}
