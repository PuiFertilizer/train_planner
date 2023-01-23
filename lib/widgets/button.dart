import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(255, 56, 163, 165),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0)
          ),
        ),
      ) ,
    );
  }
}