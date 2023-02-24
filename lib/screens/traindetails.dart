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
                    child: new Tab(text: 'ราคา',icon: Image.asset('assets/images/price.png',width: 45,),),
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
          child: Padding(
            padding: const EdgeInsets.all(18.0),
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
                          'สถานี/ทัศนีย์ภาพ', style: GoogleFonts.prompt(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold,),
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'เวลาถึง',
                    label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        alignment: Alignment.center,
                        child: Text(
                          'เวลาถึง', style: GoogleFonts.prompt(color: Colors.white,fontSize: 16,
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
                        ))),
                
              ],
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both
              ))
              )),
          ),
        ),
        Container(
          height: 300,
          
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/seatchart.png',height: 130,)
              ],
            ),
          ),
        ), //tab ที่ 1
        Icon(Icons.directions_car, size: 350),
      ],
    ),
  ),  
  );
  List<TrainTimetable> getTimetableData() { //เอาเวลาเข้า-ออกสถานีจาก database
    return[
      TrainTimetable('กรุงเทพ', '', '06:45'),
      TrainTimetable('มักกะสัน', '06:57', '06:58'),
      TrainTimetable('คลองตัน', '07:06', '07:07'),
      TrainTimetable('หัวหมาก', '07:14', '07:15'),
      TrainTimetable('ลาดกระบัง', '07:27', '07:28'),
      TrainTimetable('หัวตะเข้', '07:32', '07:33'),
      TrainTimetable('ชุมทางฉะเชิงเทรา', '08:01', '08:02'),
      TrainTimetable('ชลบุรี', '08:35', '08:36'),
      TrainTimetable('ชุมทางศรีราชา', '08:54', '08:55'),
      TrainTimetable('พัทยา', '09:13', '09:14'),
      TrainTimetable('สวนนงนุช', '09:38', '09:39'),
      TrainTimetable('บ้านพลูตาหลวง', '09:50', ''),
    ];
  }

}

class TimetableDataSource extends DataGridSource{
  TimetableDataSource(List<TrainTimetable> trainTimetables) {
    dataGridRows = trainTimetables
      .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
        DataGridCell<String>(columnName: 'สถานี', value: dataGridRow.station,),
        DataGridCell<String>(columnName: 'เวลาถึง', value: dataGridRow.arrtime),
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
  TrainTimetable(this.station, this.arrtime, this.deptime);
  final String station;
  final String arrtime;
  final String deptime;

}