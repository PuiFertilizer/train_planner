
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/favourite.dart';
import 'screens/planner.dart';

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
        backgroundColor: Color(0xffd9ffbf),
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: selectIndex==0?Colors.green:Colors.grey,),
          label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.star,color: selectIndex==1?Colors.green:Colors.grey,),
          label: 'รายการโปรด'),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: selectIndex==2?Colors.green:Colors.grey,),
          label: 'แผนเดินทาง'),
        ]),
    );
  }
}