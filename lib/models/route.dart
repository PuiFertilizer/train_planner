class Routes {
  int id = 0;
  String train = '';
  String station = '';
  String time = '';
  String line = '';
  //String order = '';

  Routes({
    required this.id,
    required this.train,
    //required this.order,
    required this.station,
    required this.time,
    required this.line,
  });

  Routes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    train = json['train'].toString();
    station = json['station'];
    time = json['time'];
    line = json['line'].toString();
    //order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;
    data['train'] = train;
    data['station'] = station;
    data['time'] = time;
    data['line'] = line;
    //data['order'] = order;
    return data;
  }
}

/*class Searchkey {
  String start = '';
  String end = '';
  String date = '';
  Searchkey({required this.start, required this.end, required this.date});
  Searchkey.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    data['date'] = date;
    return data;
  }
}*/
