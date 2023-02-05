import 'package:sqflite/sqflite.dart';
import '../models/task.dart';

//backup dbhelper

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _taskTableName = 'tasks';
  static String currentTable = '';

  static Future<void> initTaskDb(int planID) async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        print('creating a new task');
        return db.execute("Create table 'tasks'("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "planid INTEGER, "
            "title STRING, attraction STRING, date STRING, "
            "startTime STRING, endTime STRING"
            "FOREIGN KEY (planid) REFERENCES plans (planid))");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert function called');
    return await _db?.insert(_taskTableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_taskTableName, orderBy: "startTime");
  }

  static delete(Task task) async {
    return await _db!
        .delete(_taskTableName, where: 'id=?', whereArgs: [task.id]);
  }
}
