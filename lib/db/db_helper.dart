import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:train_planner/models/result_model.dart';
import 'package:web_scraper/web_scraper.dart';
import '../models/task.dart';
import '../models/route.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableTask = 'tasks';
  static const String _tableRoute = 'routes';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}db.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print('creating a new one');
          //task table
          db.execute("Create table $_tableTask("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING, attraction STRING, date STRING, "
              "startTime STRING, endTime STRING)");
          //route table
          db.execute("Create table $_tableRoute("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "train STRING, station STRING, time STRING)") /*.then((value) => updater.updateTrain())*/;
        },
      );

      cleanAndUpdate();
      //_db?.delete(_tableRoute).whenComplete(() => updater.updateTrain()));
    } catch (e) {
      print(e);
    }
  }

  static void cleanAndUpdate() async {
    print("delete call");
    await _db?.delete(_tableRoute);
    await _db!.execute('DELETE FROM $_tableRoute');
    await updateTrain();
  }

  //task
  static Future<int> insert(Task? task) async {
    print('insert function called');
    return await _db?.insert(_tableTask, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableTask, orderBy: "startTime");
  }

  static delete(Task task) async {
    return await _db!.delete(_tableTask, where: 'id=?', whereArgs: [task.id]);
  }

  //route
  static Future<int> insertR(Routes? route) async {
    print('insert function called');
    return await _db?.insert(_tableRoute, route!.toJson()) ?? 1;
  }

  static Future<List<Result>> seachR(String start, String end) async {
    print("query function called");
    List<Map<String, dynamic>> depart = [];
    List<Map<String, dynamic>> arrive = [];
    await Future.wait<void>([
      _db!
          .query(_tableRoute,
              where: 'station=?', whereArgs: [start], orderBy: "train")
          .then((value) => depart = value)
    ]);
    await Future.wait<void>([
      _db!
          .query(_tableRoute,
              where: 'station=?', whereArgs: [end], orderBy: "train")
          .then((value) => arrive = value)
    ]);
    //print(depart);
    //print(arrive);
    List<Result> result = [];
    int i = 0, j = 0;
    for (; i < arrive.length && j < depart.length;) {
      var e = Routes.fromJson(arrive[i]);
      var s = Routes.fromJson(depart[j]);

      //print(s.station + s.train + s.time);
      //print(e.station + e.train + e.time);

      TimeOfDay startTime = TimeOfDay(
          hour: int.parse(s.time.split(":")[0]),
          minute: int.parse(s.time.split(":")[1]));
      TimeOfDay endTime = TimeOfDay(
          hour: int.parse(e.time.split(":")[0]),
          minute: int.parse(e.time.split(":")[1]));
      //convert time to double
      double toDouble(TimeOfDay t) => t.hour + t.minute / 60.0;
      if (s.train == e.train && toDouble(startTime) < toDouble(endTime)) {
        Result x = Result(
            departureStation: s.station,
            departureTime: s.time,
            arriveStation: e.station,
            arriveTime: e.time,
            traintype: '',
            trainNumber: s.train);
        result.add(x);
        i++;
        j++;
      } else {
        if (int.parse(s.train) > int.parse(e.train)) {
          i++;
        } else {
          j++;
        }
      }
    }

    return result;
  }

  static Future<void> updateTrain() async {
    //String trainPath = "assets/db/train.txt";
    RegExp reStname = RegExp(r'(?<=<b>)(.*?)(?=</b>)', multiLine: true);
    RegExp reTrname = RegExp(r'([0-9]{1,4}(?=</a>))', multiLine: true);
    RegExp reTime = RegExp(r'[0-9]{2}:[0-9]{2}|arrow', multiLine: true);
    int id = 1;
    for (int line = 1; line <= 7; line++) {
      for (int route = 1; route <= 2; route++) {
        String webPath = "https://ttsview.railway.co.th/";
        final webScraper = WebScraper(webPath);
        if (await webScraper.loadWebPage(
            '/SRT_Schedule2022.php?ln=th&line=$line&trip=$route')) {
          String pageHTML = webScraper.getPageContent();
          Iterable<RegExpMatch> stations = reStname.allMatches(pageHTML);
          Iterable<RegExpMatch> trains = reTrname.allMatches(pageHTML);
          Iterable<RegExpMatch> time = reTime.allMatches(pageHTML);
          int timeCounter = 0;
          Batch batch = _db!.batch();
          for (var i in time) {
            if (i.groupNames.toString() != " ") {
              if (time.elementAt(timeCounter)[0].toString() == 'arrow') {
                timeCounter++;
                continue;
              }

              Routes route = Routes(
                  id: id,
                  train: trains
                      .elementAt((timeCounter % trains.length))[0]
                      .toString(),
                  station: stations
                      .elementAt(timeCounter ~/ trains.length)[0]
                      .toString(),
                  time: time.elementAt(timeCounter)[0].toString());
              batch.insert(_tableRoute, route.toJson());
              //DBHelper.insertR(route);
              id++;
            }
            timeCounter++;
          }
          await batch.commit(noResult: true);
        }
      }
    }
  }
}
