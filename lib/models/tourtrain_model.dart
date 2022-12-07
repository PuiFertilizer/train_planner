class Tour {
  String imageUrl;
  String tourname;
  String description;


  Tour({
    required this.imageUrl,
    required this.tourname,
    required this.description,

  });
}

List<Tour> tours = [
  Tour(
    imageUrl: 'assets/images/steam.jpg',
    tourname: 'รถจักรไอนํ้า อยุธยา',
    description: '26 มีนาคม',

  ),
  Tour(
    imageUrl: 'assets/images/namtok.jpg',
    tourname: 'นํ้าตกไทรโยคน้อย',
    description: 'ทุกวันเสาร์อาทิตย์',

  ),
 Tour(
    imageUrl: 'assets/images/suanson.jpg',
    tourname: 'สวนสนประดิพัทธ์',
    description: 'ทุกวันเสาร์อาทิตย์',

  ),
  
  
];