class Route {
  int id = 0;
  String train = '';
  String station = '';
  String time = '';

  Route(
      {required this.id,
      required this.train,
      required this.station,
      required this.time});

  Route.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    train = json['train'];
    station = json['station'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['train'] = train;
    data['station'] = station;
    data['time'] = time;
    return data;
  }
}
