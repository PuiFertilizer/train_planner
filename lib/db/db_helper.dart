import 'package:sqflite/sqflite.dart';

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
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        print('creating a new one');
        //task table
        db.execute("Create table $_tableTask("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, attraction STRING, date STRING, "
            "startTime STRING, endTime STRING)");
        //route table
        db.execute("Create table $_tableRoute("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "train STRING, station STRING, time STRING)");
      });
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
  static Future<int> insertR(Route? route) async {
    print('insert function called');
    return await _db?.insert(_tableRoute, route!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> queryR() async {
    print("query function called");
    return await _db!.query(_tableRoute);
  }
}
