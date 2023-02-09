import 'package:sqflite/sqflite.dart';
import '../models/task.dart';
import '../models/plan_model.dart';

_onConfigure(Database db) async {
  // Add support for cascade delete
  await db.execute("PRAGMA foreign_keys = ON");
}

class PlanDBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _planTableName = 'plans';
  static const String _taskTableName = 'tasks';

  static Future<void> initPlanDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}plans.db';
      _db = await openDatabase(path,
          onConfigure: _onConfigure,
          version: _version, onCreate: (db, version) {
        print('creating new plan');
        db.execute("Create table 'plans'("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "planname STRING, plandate STRING, description STRING, "
            "image BLOB)");
        db.execute("Create table 'tasks'("
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

  //plan control
  static Future<int> createPlan(Plann? plann) {
    return _db!.insert(_planTableName, plann!.toJson());
  }

  static Future<int> editPlan(Plann? plann) async {
    return await _db?.update(_planTableName, plann!.toJson(),
            where: 'id=?', whereArgs: [plann.id]) ??
        1;
  }

  static Future<List<Map<String, dynamic>>> queryPlan() async {
    print("query function called");
    return await _db!.query(_planTableName, orderBy: "plandate");
  }

  static deletePlan(Plann plann) async {
    return await _db!
        .delete(_planTableName, where: 'id=?', whereArgs: [plann.id]);
  }

  //task control
  static Future<int> insertTask(Task? task) async {
    print('insert function called');
    return await _db?.insert(_taskTableName, task!.toJson()) ?? 1;
  }

  /////
  static Future<int> editTask(Task? task) async {
    print('insert function called');
    return await _db?.update(_taskTableName, task!.toJson(),
            where: 'id = ?', whereArgs: [task.id]) ??
        1;
  }

  static Future<List<Map<String, dynamic>>> queryTask(int planid) async {
    print("query function called");
    return await _db!.query(_taskTableName,
        where: 'planid = ?', whereArgs: [planid], orderBy: "startTime");
  }

  static deleteTask(Task task) async {
    return await _db!
        .delete(_taskTableName, where: 'id=?', whereArgs: [task.id]);
  }
}
