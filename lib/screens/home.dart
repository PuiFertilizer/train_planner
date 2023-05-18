import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/searchresult.dart';

import '../db/datalist.dart';

//import 'package:train_planner/widgets/Tourtrain_Carousel.dart';

import '../widgets/Destination_Carousel.dart';

import '../widgets/Tourtrain_Carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateList(String value) {
    //function กรอง items ต่างๆ
  }
  //String? _selectedStation;

  String source = ' ';
  String destination = ' ';
  String date = ' ';

  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 204, 153),
        title: Text('หน้าหลัก',
            style: GoogleFonts.prompt(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/tachompoo.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("    คุณอยากเดินทางไปที่ใด",
                            style: GoogleFonts.prompt(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ],
                    )),
              ],
            ),
            Positioned.fill(
              top: 100,
              bottom: 580,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 280,
                  height: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 221, 221),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      const SizedBox(height: 200.0),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Text(
                              "สถานีต้นทาง",
                              style: GoogleFonts.prompt(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            ListView(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: stationList,
                                  dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
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
                                      hintText: "สถานีหรือชื่อจังหวัด"),
                                  popupItemDisabled: isItemDisabled,
                                  onChanged: sourceSelectionChanged,
                                  showSearchBox: true,
                                  searchFieldProps: const TextFieldProps(
                                    cursorColor:
                                        Color.fromARGB(255, 0, 181, 91),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'สถานีปลายทาง',
                                  style: GoogleFonts.prompt(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: stationList,
                                  dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
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
                                      hintText: "สถานีหรือชื่อจังหวัด"),
                                  popupItemDisabled: isItemDisabled,
                                  onChanged: destinationSelectionChanged,
                                  showSearchBox: true,
                                  searchFieldProps: const TextFieldProps(
                                    cursorColor: Colors.blue,
                                  ),
                                  onSaved: ((newValue) {
                                    destination = newValue!;
                                  }),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'วันเดินทาง',
                                  style: GoogleFonts.prompt(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                TextField(
                                  controller: _date,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    filled: true, //<-- SEE HERE
                                    fillColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    icon: const Icon(
                                        Icons.calendar_today_rounded),
                                  ),
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickeddate != null) {
                                      setState(() {
                                        _date.text = DateFormat('dd/MM/yyyy')
                                            .format(pickeddate);
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
                                          builder: (context) => Searchresult(
                                              source: source,
                                              destination: destination,
                                              date: _date.text)),
                                    ); //ไปที่หน้าผลการค้นหา
                                  }, //มีการ Query
                                  icon: const Icon(Icons.search),
                                  label: Text(
                                    "ค้นหา",
                                    style: GoogleFonts.prompt(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(90, 40),
                                    backgroundColor:
                                        const Color.fromARGB(255, 56, 163, 165),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [Container()],
            ),
            Column(
              children: <Widget>[
                const SizedBox(height: 560.0),
                Destination_Carousel(),
                const SizedBox(height: 10.0),
                Tourtrain_Carousel()
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void sourceSelectionChanged(String? s) {
    source = s!;
  }

  void destinationSelectionChanged(String? s) {
    destination = s!;
  }
}
