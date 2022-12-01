
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'screens/home.dart';
import 'screens/favourite.dart';
import 'screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {

  

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: MyHomePage()); //หน้าหลัก
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController pageController = PageController();
  List<Widget>pages=[HomePage(),Favourite(),Planner()];

  int selectIndex=0;
  void onPageChanged(int index){
    setState(() {
      selectIndex=index;
    });
  }

  void onItemTap(int selectedItems){
    pageController.jumpToPage(selectedItems);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
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
          BottomNavigationBarItem(icon: Icon(Icons.home,color: selectIndex==0?Color.fromARGB(255, 0, 100, 42):Colors.black,),
          label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.star,color: selectIndex==1?Color.fromARGB(255, 0, 100, 42):Colors.black,),
          label: 'รายการโปรด'),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: selectIndex==2?Color.fromARGB(255, 0, 100, 42):Colors.black,),
          label: 'แผนเดินทาง'),
        ]),
    );
  }
}