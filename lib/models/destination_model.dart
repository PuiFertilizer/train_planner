import 'package:train_planner/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;

  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,

    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/chiangmai.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/namtok.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/nongkai.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/chiangmai.jpg',
    city: 'เชียงใหม่',

    description: 'เชียงใหม่',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/nongkai.jpg',
    city: 'หนองคาย',

    description: 'หนองคาย',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/surat.jpg',
    city: 'สุราษฎร์ธานี',

    description: 'สุราษฎร์ธานี',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/tachompoo.jpg',
    city: 'ลำพูน',

    description: 'ลำพูน',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/suanson.jpg',
    city: 'ประจวบฯ',

    description: 'หัวหิน',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/suanson.jpg',
    city: 'สงขลา',

    description: 'ชุมทางหาดใหญ่',
    activities: activities,
  ),
];