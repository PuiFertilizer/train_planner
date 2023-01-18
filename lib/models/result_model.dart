class Result {
  String departureStation;
  String departureTime;
  String arriveStation;
  String arriveTime;
  String traintype;
  String trainNumber;
  String price;

  Result({
    required this.departureStation,
    required this.departureTime,
    required this.arriveStation,
    required this.arriveTime,
    required this.traintype,
    required this.trainNumber,
    required this.price
  });
}

List <Result> results = [
  Result(
    departureStation: 'กรุงเทพ (หัวลำโพง)', 
    departureTime: '06:45', 
    arriveStation: 'บ้านพลูตาหลวง', 
    arriveTime: '09:50', 
    traintype: 'เร็ว', 
    trainNumber: 'ขบวน 997', 
    price: '170 บาท'
  ),
  Result(
    departureStation: 'กรุงเทพ (หัวลำโพง)', 
    departureTime: '06:55', 
    arriveStation: 'บ้านพลูตาหลวง', 
    arriveTime: '11:20', 
    traintype: 'ธรรมดา', 
    trainNumber: 'ขบวน 283', 
    price: '37 บาท'
  )
];