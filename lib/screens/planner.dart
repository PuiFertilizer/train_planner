import 'package:flutter/material.dart';

class Planner extends StatefulWidget {
  const Planner({ Key? key }) : super(key: key);

  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Planner"),),
    );
  }
}