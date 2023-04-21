class Task {
  int? id;
  String? title;
  String? attraction;
  String? date;
  String? startTime;
  String? endTime;
  int planid = -1;

  Task(
      {this.id,
      this.title,
      this.attraction,
      this.date,
      this.startTime,
      this.endTime,
      required this.planid});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    attraction = json['attraction'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    planid = json['planid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['attraction'] = attraction;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['planid'] = planid;
    return data;
  }
}
