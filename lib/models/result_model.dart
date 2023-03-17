//เก็บข้อมูลรายการผลการค้นหา

class Result {
  String departureStation; //สถานีต้นทาง
  String departureTime;    //เวลาออกต้นทาง
  String arriveStation;    //สถานีปลายทาง
  String arriveTime;       //เวลาถึงปลายทาง
  String traintype;        //ประเภทขบวนรถ (เช่น ด่วนพิเศษ ด่วน เร็ว)
  String trainNumber;      //เลขขบวนรถ
  String classes;          //ชั้นที่นั่ง
  String coachtype1;
  
           

  Result({
    required this.departureStation,
    required this.departureTime,
    required this.arriveStation,
    required this.arriveTime,
    required this.traintype,
    required this.trainNumber,
    required this.classes,
    required this.coachtype1,
  });
}

List <Result> results = [
  Result(
    departureStation: 'กรุงเทพ (หัวลำโพง)', 
    departureTime: '06:45', 
    arriveStation: 'บ้านพลูตาหลวง', 
    arriveTime: '09:50', 
    traintype: 'เร็ว', 
    trainNumber: '997', 
    classes: 'ชั้น 2',
    coachtype1: 'รถนั่งปรับอากาศ'
    
  ),
  Result(
    departureStation: 'กรุงเทพ (หัวลำโพง)', 
    departureTime: '06:55', 
    arriveStation: 'บ้านพลูตาหลวง', 
    arriveTime: '11:20', 
    traintype: 'ธรรมดา', 
    trainNumber: '283', 
    classes: 'ชั้น 3',
    coachtype1: 'รถนั่งพัดลม'
    
  )
];