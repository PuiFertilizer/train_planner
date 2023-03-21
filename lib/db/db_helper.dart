import 'package:sqflite/sqflite.dart';
import 'package:train_planner/models/result_model.dart';

import '../models/task.dart';
import '../models/route.dart';
import '../db/update.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableTask = 'tasks';
  static const String _tableRoute = 'routes';
  static Updater updater = Updater();
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
        /*onOpen: (db) =>
              db.execute("DROP TABLE IF EXISTS $_tableRoute").then((value) => db
                  .execute("Create table $_tableRoute("
                      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                      "train STRING, station STRING, time STRING)")
                  .then((value) => updater.updateTrain()))*/
      );
    } catch (e) {
      print(e);
    }
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
    print(depart);
    print(arrive);
    List<Result> result = [];
    int i = 0, j = 0;
    for (; i < arrive.length && j < depart.length;) {
      var s = Routes.fromJson(arrive[i]);
      var e = Routes.fromJson(depart[j]);
      print(s.station + s.train + s.time);
      print(e.station + e.train + e.time);
      if (s.train == e.train) {
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
}
