import 'package:train_planner/models/activity_model.dart';

class Plann {
  String imageUrl;
  String planname;
  String plandate;
  String description;


  Plann({
    required this.imageUrl,
    required this.planname,
    required this.plandate,
    required this.description,

  });
}



List<Plann> planns = [
  Plann(
    imageUrl: 'assets/images/chiangmai.jpg',
    planname: 'สัมผัสธรรมชาติ กับการท่องรถไฟท้องถิ่นเชียงใหม่',
    plandate: '5 ม.ค. - 7 ม.ค',
    description: '13 วันก่อนเดินทาง',

  ),
  Plann(
    imageUrl: 'assets/images/nongkai.jpg',
    planname: 'รถไฟไปสัตหีบ',
    plandate: '15 ม.ค.',
    description: '23 วันก่อนเดินทาง',

  ),
  
  
];