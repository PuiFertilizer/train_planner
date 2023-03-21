import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:train_planner/db/db_helper.dart';
import 'package:train_planner/db/update.dart';
import 'screens/home.dart';
import 'screens/favourite.dart';
import 'screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Future<void> main() async {
  Updater updater = Updater();
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  await updater.updateTrain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: MyHomePage()); //หน้าหลัก
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  List<Widget> pages = [const HomePage(), const Favourite(), const Planner()];

  int selectIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      // appBar: AppBar(

      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 87, 204, 153),
          onTap: onItemTap,
          iconSize: 50,
          selectedFontSize: 16,
          selectedItemColor: Colors.black,
          unselectedFontSize: 16,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: selectIndex == 0
                      ? Color.fromARGB(255, 0, 100, 42)
                      : Colors.black,
                ),
                label: 'หน้าหลัก'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  color: selectIndex == 1
                      ? Color.fromARGB(255, 0, 100, 42)
                      : Colors.black,
                ),
                label: 'รายการโปรด'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: selectIndex == 2
                      ? Color.fromARGB(255, 0, 100, 42)
                      : Colors.black,
                ),
                label: 'แผนเดินทาง'),
          ]),
    );
  }
}
