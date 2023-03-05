import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:train_planner/models/result_model.dart';
import '../widgets/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plan_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';



class TrainDetails extends StatefulWidget {


  @override
  _TrainDetailsState createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  late List<TrainTimetable> _TrainTimetable;
  late TimetableDataSource _timetableDataSource;

  @override
  void initState() {
    _TrainTimetable = getTimetableData();
    _timetableDataSource = TimetableDataSource(_TrainTimetable);
    super.initState();
  }
  
  TabBar get _tabBar => TabBar(
      indicatorColor: Colors.black, 
      labelColor: Colors.black,
      indicatorWeight: 7,
      unselectedLabelColor: Colors.black, 
      labelStyle: GoogleFonts.prompt(color: Colors.black,fontSize: 17,),
      tabs: [
        new Container(
                    height: 90.0,
                    child: new Tab(text: 'ช่วงเวลา',icon: Image.asset('assets/images/clock.png',width: 45,),),
                  ),
       new Container(
                    height: 90.0,
                    child: new Tab(text: 'ขบวนรถ',icon: Image.asset('assets/images/train1.png',width: 45,),),
                  ),
        new Container(
                    height: 90.0,
                    child: new Tab(text: 'ค่าโดยสาร',icon: Image.asset('assets/images/price.png',width: 45,),),
                  ),
      ],
      
    );

  


  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
  child: Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'ขบวน 997 เร็ว',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                            fontWeight: FontWeight.bold,),
                  
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: 'กรุงเทพ - บ้านพลูตาหลวง',style: GoogleFonts.prompt(color: Colors.black,fontSize: 18,
                            )
                  //style: textTheme.subtitle,
                )
              ]),
        ),
      ),
      iconTheme: IconThemeData(
      color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
       //title: Text('AppBar'),
      
      
      bottom: PreferredSize(
        preferredSize: new Size(200.0, 100.0),
        child: Container(
          child: Column(
            children: [    
            Material(
              elevation: 18.0,
              color: Color.fromARGB(255, 138, 237, 153),
              child: Theme( //<-- SEE HERE
                data: ThemeData().copyWith(splashColor: Colors.white),
                child: _tabBar),
            ),
          ],),
        )
        // child: Material(
        //   color: Colors.green,
        //   child: Theme( //<-- SEE HERE
        //       data: ThemeData().copyWith(splashColor: Colors.redAccent),
        //       child: _tabBar),
        // )
        
      ),
      //backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),
    
    body: TabBarView(
      children: [ 
        Container( //tab ที่ 1
          color: Color.fromARGB(255, 217, 217, 217),
          
          child: Column(
            children: [
              Container(
                height: 530,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,top: 18,right: 18,bottom: 10),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Color.fromARGB(255, 217, 217, 217),
                      body: SfDataGridTheme(
                    data: SfDataGridThemeData(
                        headerColor: const Color(0xff009889),
                        gridLineColor: Color.fromARGB(255, 217, 217, 217), gridLineStrokeWidth: 1.5),
                    child: SfDataGrid(source: _timetableDataSource, columns: <GridColumn>[
                      GridColumn(
                          columnName: 'สถานี',
                          columnWidthMode: ColumnWidthMode.lastColumnFill,
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'สถานี', style: GoogleFonts.prompt(color: Colors.white,fontSize: 16,
                                    fontWeight: FontWeight.bold,),
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          columnName: 'เวลาออก',
                          label: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              alignment: Alignment.center,
                              child: Text(
                                'เวลาออก' ,style: GoogleFonts.prompt(color: Colors.white,fontSize: 16,
                                    fontWeight: FontWeight.bold,),
                                overflow: TextOverflow.ellipsis,
                              )))
                      
                    ],
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both
                    ))
                    )),
                ),
                
              ),
            SizedBox(height: 2,),
            ElevatedButton.icon(
                                    
             onPressed: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return DialogScene();
                  });
             },
            icon: Icon(Icons.add),
            label: Text("ทัศนียภาพข้างทางที่พบได้", //สร้างแผนใหม่
            style: GoogleFonts.prompt(color: Colors.white, fontSize: 20.0),),
            style: ElevatedButton.styleFrom(
            fixedSize: Size(350, 50),
            backgroundColor: Color.fromARGB(255, 56, 163, 165),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), 
            ),
          ),
                                    
         ),
              
            ],
          ),
          
        ),
        Container( //tab ที่ 2
          color: Color.fromARGB(255, 217, 217, 217),
          child:  SingleChildScrollView(
          
          child: Column( 
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 249, 204),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                    'ผังขบวนรถ', //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 2.0,
                                  ),
                                  SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                      Image.asset('assets/images/trainchart/trainchartCNR_depart.png',height: 30,) //ผังขบวนรถตามเลขขบวน
                                   ],
                                   ),
                                         ),
                                         SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "บ้านพลูตาหลวง", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),                    
                          ),                      
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end, 
                            children: [
                          
                          Text(
                            "กรุงเทพ (หัวลำโพง)", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          
                          ],
                        ),

                            ],
                          ),
                          
                          ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: RawScrollbar(
                    thumbColor: Color.fromARGB(255, 34, 168, 1),
                    radius: Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: seats.length,
                      itemBuilder: (BuildContext context, int index){
                        Seating seating = seats[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                              height: 550,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                                
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                    seating.coachname, //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 5.0,
                                  ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                   height: 120.0, 
                                   width: 135.0, //200
                                   image: AssetImage(seating.imageUrlExterior),
                                  fit: BoxFit.cover,
                                  ),
                                ),
                               
                              
                                ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                   height: 120.0, 
                                   width: 135.0, //200
                                   image: AssetImage(seating.imageUrlInterior),
                                  fit: BoxFit.cover,
                                  ),
                                ),
                        
                        
                          
                                ],
                             ),
                    SizedBox(height: 5,),
                    Text(seating.description,style: GoogleFonts.prompt(fontSize: 14,color: Colors.black)),

                    Text('ผังที่นั่ง' ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5,),
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 217, 217, 217),
                              
                      ),
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           
                        Padding(
                          padding: const EdgeInsets.only(left: 2,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "ทิศเที่ยวไป", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color:Colors.red)
                            ),
                            
                            
                          ),
                          SizedBox(width: 80,),
                          Text(
                            "ทิศเที่ยวกลับ", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color:Color.fromARGB(255, 4, 0, 226))
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 4, 0, 226),
                            size: 20,
                          ),
                          
                          ],
                        ),
                        ),
                        SizedBox(height: 5,),
                        Column(
                             children: [
                               Container(
                                 padding: const EdgeInsets.only(left: 10,right: 10),
                                 child: SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                      Image(
                                        height: 120.0, 
                                        //width: 200.0, //200
                                        image: AssetImage(seating.imageUrlSeatchart),
                                        fit: BoxFit.cover,
                                        )
                                   ],
                                   ),
                                         ),
                               ),
                             ],
                           ),
                           SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "บ้านพลูตาหลวง", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          
                          
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end, 
                            children: [
                          
                          Text(
                            "กรุงเทพ (หัวลำโพง)", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          
                          ],
                        ),
                        
                          
                        ]),
                    ),
                    SizedBox(height: 15,),
                    Text('สิ่งอำนวยความสะดวก' ,style: GoogleFonts.prompt(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold)),
                    //SizedBox(height: 5,),
                    Image(
                      height: 40.0, 
                      //width: 200.0, //200
                      image: AssetImage(seating.imageUrlConvience),
                      fit: BoxFit.cover,
                      )
                     ],
                          ),
                          
                          ),
                        
                          
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  
                ),
                
                
              ),
              
              
              
              
              
              
              
              
            ],
            
          ),
          

          ),
        ), 
        Container( //tab ที่ 3
          color: Color.fromARGB(255, 217, 217, 217),
          child:  SingleChildScrollView(
          
          child: Column( 
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 249, 204),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                    'ผังขบวนรถ', //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 2.0,
                                  ),
                                  SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                      Image.asset('assets/images/trainchart/trainchartCNR_depart.png',height: 30,) //ผังขบวนรถตามเลขขบวน
                                   ],
                                   ),
                                         ),
                                         SizedBox(height: 10,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                            SizedBox(width: 1,),
                            Icon(
                            Icons.arrow_back_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "บ้านพลูตาหลวง", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),                    
                          ),                      
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end, 
                            children: [
                          
                          Text(
                            "กรุงเทพ (หัวลำโพง)", //เวลาเริ่มและเวลาสิ้นสุด
                            style: GoogleFonts.prompt(
                            textStyle: 
                            TextStyle(fontSize: 12,)
                            ),
                            
                            
                          ),
                          SizedBox(width: 2,),
                            Icon(
                            Icons.arrow_forward_sharp,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 20,
                          ),
                          
                          ],
                        ),

                            ],
                          ),
                          
                          ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45,right: 45),
                  child: RawScrollbar(
                    thumbColor: Color.fromARGB(255, 34, 168, 1),
                    radius: Radius.circular(20),
                    thickness: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: seats.length,
                      itemBuilder: (BuildContext context, int index){
                        Seating seating = seats[index];
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 199, 249, 204),
                                borderRadius: BorderRadius.circular(20.0),
                                
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                    seating.coachname, //ชื่อของตู้โดยสาร
                                    style: GoogleFonts.prompt(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600,),
                                    softWrap: false,
                                     maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // new
                                     ),
                                  )
                              ],
                              ),
                              SizedBox(
                                    height: 5.0,
                                  ),
                              SizedBox(height: 5,),
                              Text(seating.description,style: GoogleFonts.prompt(fontSize: 14,color: Colors.black)),  
                                
                              
                     ],
                          ),
                          
                          ),
                        
                          
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  
                ),
                
                
              ),
                      
            ],
            
          ),
          

          ),
        ),
      ],
    ),
  ),  
  );
  List<TrainTimetable> getTimetableData() { //เอาเวลาเข้า-ออกสถานีจาก database
    return[
      TrainTimetable('กรุงเทพ', '06:45'),
      TrainTimetable('มักกะสัน',  '06:58'),
      TrainTimetable('คลองตัน',  '07:07'),
      TrainTimetable('หัวหมาก',  '07:15'),
      TrainTimetable('ลาดกระบัง',  '07:28'),
      TrainTimetable('หัวตะเข้',  '07:33'),
      TrainTimetable('ชุมทางฉะเชิงเทรา', '08:02'),
      TrainTimetable('ชลบุรี',  '08:36'),
      TrainTimetable('ชุมทางศรีราชา', '08:55'),
      TrainTimetable('พัทยา',  '09:14'),
      TrainTimetable('สวนนงนุช',  '09:39'),
      TrainTimetable('บ้านพลูตาหลวง', '09:50'),
    ];
  }

}

class TimetableDataSource extends DataGridSource{
  TimetableDataSource(List<TrainTimetable> trainTimetables) {
    dataGridRows = trainTimetables
      .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
        DataGridCell<String>(columnName: 'สถานี', value: dataGridRow.station,),
        DataGridCell<String>(columnName: 'เวลาออก', value: dataGridRow.deptime),
      ] 
      )).toList();
  }
  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){
        return Container(
          alignment: (dataGridCell.columnName == 'สถานี')
            ? Alignment.centerLeft
            : Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Text(dataGridCell.value.toString(),style: GoogleFonts.prompt(fontSize: 14),
                          overflow: TextOverflow.ellipsis),
        );
      }).toList());
  }
}

class TrainTimetable{
  TrainTimetable(this.station, this.deptime);
  final String station;
  final String deptime;
}



class Seating {
  String imageUrlExterior;
  String imageUrlInterior;
  String imageUrlSeatchart;
  String coachname;
  String description;
  String imageUrlConvience;


  Seating({
    required this.imageUrlExterior,
    required this.imageUrlInterior,
    required this.imageUrlSeatchart,
    required this.coachname,
    required this.description,
    required this.imageUrlConvience,
  });
}

class DialogScene extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height:300,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,5),
              child: Column(
                children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('ทัศนีย์ภาพเด่น', style: GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 16) ,)),
                  SizedBox(height: 20,),
                  Container(
          //color: Colors.blue,
          height: 240.0,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            Destination destination = destinations[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 210.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  bottom: 15.0,
                child: Container(
                  height: 205.0,
                  width: 200.0,
                  decoration: BoxDecoration( //ทำเงาดำ
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 10.0,
                      ),
                    ]
                  ),

                  //Padding
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(destination.city,
                             style: GoogleFonts.prompt(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                              )),
                      Text(destination.description,
                      style: GoogleFonts.prompt(
                        color: Color.fromARGB(255, 80, 80, 80),
                        fontSize: 12.0,
                      ),),
                    ],
                  ),
                )

                ),
            ),

                Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            height: 140.0, 
                            width: 200.0, //200
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column( //wra[]
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            
                          Row(
                            children: <Widget>[
                            SizedBox(width: 4.0,),
                            
                            ],
                            ),
                          ],),
                        )
                      ],
                    ),
                )

              ],
            ),
          );
            },
          ),
        
        )

              ]),

            ),
          )
        ],
      ),
    );
  }
}

List<Seating> seats = [
  Seating(
    imageUrlExterior: 'assets/images/trainimage/sprinter_Exterior.jpg',
    imageUrlInterior: 'assets/images/trainimage/sprinter_Interior.png',
    imageUrlSeatchart: 'assets/images/seatchart/กซขป76.png',
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ สปรินเตอร์',
    description: '**ไม่มีบริการอาหาร',
    imageUrlConvience: 'assets/images/ความสะดวก_กซขป.png',

  ),
  Seating(
    imageUrlExterior: 'assets/images/trainimage/daewoo_Exterior.png',
    imageUrlInterior: 'assets/images/trainimage/daewoo_interior.jpg',
    imageUrlSeatchart: 'assets/images/seatchart/กซขป76.png',
    coachname: 'ชั้น 2 กซขป.76 รถดีเซลรางปรับอากาศ แดวู (บางกรณี)',
    description: '**ไม่มีบริการอาหาร',
    imageUrlConvience: 'assets/images/ความสะดวก_กซขป.png',

  ),
  

  
  
];

class Destination {
  String imageUrl;
  String city;
  String description;


  Destination({
    required this.imageUrl,
    required this.city,
    required this.description,
  });
}
List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/chiangmai.jpg',
    city: 'แม่นำ้บางปะกง',
    description: 'สถานีฉะเชิงเทรา-ดอนสีนนท์',

  ),
  Destination(
    imageUrl: 'assets/images/nongkai.jpg',
    city: 'แกรนด์แคนยอนชลบุรี',
    description: 'สถานีชลบุรี-บางพระ',

  ),
  
];