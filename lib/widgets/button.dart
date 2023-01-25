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
        width: 150,
        height: 50,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Color.fromARGB(255, 128, 237, 193),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          label,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center,
        ),
      ) ,
    );
  }
}