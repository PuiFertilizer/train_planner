

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchfield/searchfield.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 204, 153),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child:  Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )

        ]),
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
                  style: TextStyle(
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
                width: 340,
                height: 800,
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
                              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),

                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              
                              child: ListView(
                                children: [
                                  SizedBox(height: 30,),
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: ['กรุงเทพ','เชียงใหม่','หนองคาย'],
                                    dropdownSearchDecoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      labelText: "สถานีต้นทาง",
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
                                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 2,),
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: ['กรุงเทพ','เชียงใหม่','หนองคาย'],
                                    dropdownSearchDecoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      labelText: "สถานีปลายทาง",
                                      hintText: "สถานีหรือชื่อจังหวัด"
                                    ),
                                    popupItemDisabled: isItemDisabled,
                                    onChanged: itemSelectionChanged,
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      cursorColor: Colors.blue,
                                ),
                                  ),

                                ],
                              )
                            ),
                          //   Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 20),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(10)
                          //   ),
                          //     child: SearchField(
                                
                                
                          //       hint: 'ค้นหาตามชื่อสถานีหรือจังหวัด',
                          //       searchInputDecoration: InputDecoration(
                                  
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(10)
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Colors.blue.withOpacity(0.8),
                          //             width: 2
                          //           ) ,
                          //           borderRadius: BorderRadius.circular(10)
                          //           ),
                          //           isDense: true,
                          //           contentPadding: EdgeInsets.all(10),
                          //       ),
                          //       searchStyle: TextStyle(fontSize: 14),
                          //       itemHeight: 25,
                          //       maxSuggestionsInViewPort: 3,
                          //       suggestionsDecoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(10)
                          //       ),
                          //       onTap: (value) {
                          //         setState(() {
                          //           _selectedStation = value;
                          //         });
                          //       },
                          //       suggestions: [
                          //         'กรุงเทพ',
                          //         'เชียงใหม่',
                          //         'อุบลราชธานี',
                          //         'หนองคาย',
                          //         'สุราษฏร์ธานี'
                          //       ],
                          //     ),
                          //  ),
                          //  Container(
                          //   height: 100,
                            
                          //   decoration: BoxDecoration(
                              
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       _selectedStation == null ? Text('กรุณาเลือกสถานีต้นทาง',style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.blue
                          //       ),) : Text(_selectedStation!, style: TextStyle(
                          //         color: Colors.blue,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w600
                          //       ))
                          //     ],
                          //   ),
                          //  ) 
                            
                          ],
                          
                          

                        ),
                        
                        
                        
                        ),
                        
                    
                    //This is the actual widget 
                
                     // พื้นที่ Form ค้นหา
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
