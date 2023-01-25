class Task{
  int? id;
  String? title;
  String? attraction;
  String? date;
  String? startTime;
  String? endTime;

  Task({
    this.id,
    this.title,
    this.attraction,
    this.date,
    this.startTime,
    this.endTime,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    attraction = json['attraction'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['attraction'] = this.attraction;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}