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

    planname: 'สัมผัสธรรมชาติ กับการท่องรถไฟท้องถิ่นเชียงใหม่',
    plandate: '5 May - 7 May 2023',
    noOfDate: '3 วัน'
    //รายละเอียดต่างๆ ของแผน

  ),
  Plann(

    planname: 'เที่ยวตลาดโรงเกลือ และด่านพรมแดนคลองลึก',
    plandate: '11 May - 12 May 2023',
    noOfDate: '2 วัน'
    //รายละเอียดต่างๆ ของแผน

  ),
  
  
];