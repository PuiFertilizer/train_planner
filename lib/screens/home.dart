

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../widgets/NavBar.dart';
import '../screens/searchresult.dart';


//import 'package:train_planner/widgets/Tourtrain_Carousel.dart';

import '../widgets/Destination_Carousel.dart';

import '../widgets/Tourtrain_Carousel.dart';


class HomePage extends StatefulWidget{
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {





  void updateList(String value){
    //function กรอง items ต่างๆ
    
  }
  String? _selectedStation;
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('side'),
      ),
        body: Container(
          
          child: SingleChildScrollView(
            child: Stack(

          children: [
            Image.asset("assets/images/tachompoo.jpg",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
            Column(
              

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                  "คุณอยากเดินทางไปที่ใด",
                  style: GoogleFonts.prompt(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    )
                ),
                    ],
                  )
                
            ),
              ],
            ),
            Positioned.fill(
              top: 100,
              bottom: 580,
              
              child: Align(
                alignment: Alignment.center,
              child: Container(
                width: 320,
                height: 600,
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(15),
                
                  
                ),
                
                
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(height: 200.0) , 
                  
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          
                          children: [
                            Text(
                              "กรุณาเลือกสถานีต้นทาง",
                              style: GoogleFonts.prompt(color: Colors.black, fontSize: 20.0),

                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              
                              child: ListView(
                                children: [
                                  SizedBox(height: 30,),
                                  DropdownSearch<String>(
                                    
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: ['กรุงเทพ  จ.กรุงเทพ','เชียงใหม่  จ.เชียงใหม่','หนองคาย  จ.หนองคาย','อุบลราชธานี  จ.อุบลราชธานี','สุราษฎร์ธานี  จ.สุราษฎร์ธานี','ชุมทางหาดใหญ่  จ.สงขลา'],
                                    dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      
                                      hintText: "สถานีหรือชื่อจังหวัด"
                                    ),
                                    popupItemDisabled: isItemDisabled,
                                    onChanged: itemSelectionChanged,
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      cursorColor: Color.fromARGB(255, 0, 181, 91),
                                ),
                                    
                                    
                                  ),
                                  SizedBox(height: 15,),
                                  Text('กรุณาเลือกสถานีปลายทาง',
                                  style: GoogleFonts.prompt(color: Colors.black, fontSize: 20.0),),
                                  SizedBox(height: 2,),
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: ['กรุงเทพ','เชียงใหม่','หนองคาย','อุบลราชธานี','สุราษฎร์ธานี','ชุมทางหาดใหญ่'],
                                    dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      
                                      hintText: "สถานีหรือชื่อจังหวัด"
                                    ),
                                    popupItemDisabled: isItemDisabled,
                                    onChanged: itemSelectionChanged,
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      cursorColor: Colors.blue,
                                ),
                                  ),
                                  SizedBox(height: 15,),
                                  Text('วันเดินทางไป',
                                  style: GoogleFonts.prompt(color: Colors.black, fontSize: 20.0),),
                                  SizedBox(height: 2,),
                                  TextField(
                                    controller: _date,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      icon : Icon(Icons.calendar_today_rounded),
                                      
                                    ),
                                    onTap: () async {
                                      DateTime? pickeddate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101)
                                      );
                                      if (pickeddate != null) {
                                        setState( () {
                                          _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(height: 10,),
                                  ElevatedButton.icon(
                                    
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Searchresult()),);
                                    },
                                    icon: Icon(Icons.search),
                                    label: Text("สถานีใกล้ตัว",
                                    style: GoogleFonts.prompt(color: Colors.black, fontSize: 20.0),),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(90, 40),
                                      backgroundColor: Color.fromARGB(255, 128, 237, 193),
                                       shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    
                                  ),
                                  SizedBox(height: 10,),
                                  ElevatedButton.icon(
                                    
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Searchresult()),);
                                    },
                                    icon: Icon(Icons.search),
                                    label: Text("ค้นหา",
                                    style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(90, 40),
                                      backgroundColor: Color.fromARGB(255, 56, 163, 165),
                                       shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    
                                  ),
                                  

                                ],
                              )
                            ),

                            
                          ],
                          
                          

                        ),
                        
                        
                        
                        ),

                    ],
                  ),
                ),
                
              ),
              
              
              
            ),
           
          ), 
          Column(children: [Container(
            
          )

          ],),
          
             
          Column(
            
            
            children: <Widget>[
              SizedBox(height: 550.0) ,
              Destination_Carousel(),
              SizedBox(height: 10.0) ,
              Tourtrain_Carousel()

                  
                  
              
              
            ],
          ) ,
           
        ],  
          ),
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

  void itemSelectionChanged(String? s) {
    print(s);
  }
  
}
