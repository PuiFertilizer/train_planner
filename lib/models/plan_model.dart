import 'package:flutter/foundation.dart';

class Plann {
  int? id;
  Uint8List? image;
  String? planname;
  String? plandate;
  String? description;

  Plann({
    this.id,
    this.image,
    this.planname,
    this.plandate,
    this.description,
  });

  Plann.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    planname = json['planname'];
    plandate = json['plandate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['planname'] = planname;
    data['plandate'] = plandate;
    data['description'] = description;
    return data;
  }
}

/*
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
*/