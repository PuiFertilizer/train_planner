import 'package:flutter/material.dart';
import '../widgets/NavBar.dart';
class Searchresult extends StatefulWidget {
  const Searchresult({ Key? key }) : super(key: key);

  @override
  _SearchresultState createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        
      ),
    );
  }
}