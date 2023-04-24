import 'package:train_planner/models/activity_model.dart';

class Plann {

  String planname;
  String plandate;
  String noOfDate;
  //รายละเอียดของแผน


  Plann({

    required this.planname,
    required this.plandate,
    required this.noOfDate,
    //รายละเอียดของแผน
  });
}



List<Plann> planns = [
  Plann(

    planname: 'เที่ยวฉะเชิงเทราและปราจีนบุรีด้วยรถไฟชั้น 3',
    plandate: '22/4/2023 - 22/4/2023',
    noOfDate: '1 วัน'

  ),
  
  
  
];