class Plan {
  int? id;
  String name = "";

  Plan({this.id, required this.name});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;
    data['name'] = name;
    return data;
  }
}
