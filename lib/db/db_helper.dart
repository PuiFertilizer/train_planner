import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:train_planner/models/result_model.dart';
import 'package:train_planner/models/traindatalist.dart';
import 'package:web_scraper/web_scraper.dart';
import '../models/stationdatalist.dart';
import '../models/task.dart';
import '../models/route.dart';
import '../models/plan.dart';

class StationTrainList {
  String trainNo;
  String originStation;
  String destinationStation;
  String stationTime;

  StationTrainList({
    required this.trainNo,
    required this.originStation,
    required this.destinationStation,
    required this.stationTime,
  });
}

class TrainTimetable {
  //ช่วงเวลา (ตารางเวลา) ของแต่ละขบวน

  String station; //สถานี
  String deptime; //เวลาจอดที่สถานี
  TrainTimetable({required this.station, required this.deptime});
}

class DBHelper {
  static Database? _db;
  static const int _version = 3;
  static const String _tableTask = 'tasks';
  static const String _tableRoute = 'routes';
  static const String _tablePlan = 'plans';

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
          db.execute("Create table $_tablePlan("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "name STRING)");
          db.execute("Create table $_tableTask("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING, attraction STRING, date STRING, "
              "startTime STRING, endTime STRING, "
              "planid INTEGER, "
              "FOREIGN KEY (planid) REFERENCES plans (id)"
              "ON DELETE CASCADE"
              ")");
          //route table
          db.execute("Create table $_tableRoute("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "train STRING, station STRING, time STRING, line STRING)") /*.then((value) => updater.updateTrain())*/;
          updateTrain();
        },
        onUpgrade: (db, int oldVersion, int newVersion) {
          // If you need to add a column
          print("upgrade");
          if (1 >= oldVersion) {
            db.execute("ALTER TABLE $_tableRoute ADD COLUMN line STRING");
          }
          if (2 >= oldVersion) {
            db.execute('DROP TABLE $_tableTask');
            db.execute("Create table $_tableTask("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "title STRING, attraction STRING, date STRING, "
                "startTime STRING, endTime STRING, "
                "planid INTEGER, "
                "FOREIGN KEY (planid) REFERENCES plans (id)"
                "ON DELETE CASCADE"
                ")");
            db.execute("Create table $_tablePlan("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "name STRING)");
          }
        },
        onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
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

  //plan
  static Future<int> newPlan(String name) async {
    print('insert function called');
    Plan plan = Plan(name: name);
    return await _db?.insert(_tablePlan, plan.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> queryPlan() async {
    print("query plan function called");
    return await _db!.query(_tablePlan);
  }

  static Future<List<Map<String, dynamic>>> getPlan(int id) async {
    print("getPlan function called $id");
    return await _db!.query(_tablePlan, where: 'id=?', whereArgs: [id]);
  }

  static deletePlan(Plan plan) async {
    return await _db!.delete(_tablePlan, where: 'id=?', whereArgs: [plan.id]);
  }

  /*static List<DateTime> getPlanDate(int plan) {
    List<DateTime> tasks = [];
    print("get date");
    query(plan).then((value) {
      print(value.toString());
      for (var element in value) {
        print(DateFormat('MM/dd/yyyy').parse(Task.fromJson(element).date!));
        tasks.add(DateFormat('MM/dd/yyyy').parse(Task.fromJson(element).date!));
      }
    });
    tasks.sort((a, b) {
      //sorting in descending order
      return a.compareTo(b);
    });
    print(tasks.toString());
    return tasks;
  }*/

  //task
  static Future<int> insert(Task? task) async {
    print('insert function called');
    return await _db?.insert(_tableTask, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query(int planid) async {
    print("query task function called $planid");
    return await _db!.query(_tableTask,
        where: 'planid=?', whereArgs: [planid], orderBy: "date, startTime");
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
    List<Result> result = [];
    int i = 0, j = 0;
    for (; i < arrive.length && j < depart.length;) {
      var e = Routes.fromJson(arrive[i]);
      var s = Routes.fromJson(depart[j]);
      if (s.train == e.train) {
        int resultLine = int.parse(s.line) - 1;
        if (line[resultLine].indexOf(s.station) <
                line[resultLine].indexOf(e.station) &&
            int.parse(s.train) % 2 != 0) {
          try {
            TrainList train = trainLists[resultLine]
                .firstWhere((element) => element.trainNo == s.train);
            Result x = Result(
                departureStation: s.station,
                departureTime: s.time,
                arriveStation: e.station,
                arriveTime: e.time,
                traintype: train.trainType,
                trainNumber: s.train,
                classes: train.classes,
                coach: train.coach);
            result.add(x);
          } catch (e) {
            print(e);
          }
        } else if ((line[resultLine].indexOf(s.station) >
                line[resultLine].indexOf(e.station) &&
            int.parse(s.train) % 2 == 0)) {
          try {
            TrainList train = trainLists[resultLine]
                .firstWhere((element) => element.trainNo == s.train);
            Result x = Result(
                departureStation: s.station,
                departureTime: s.time,
                arriveStation: e.station,
                arriveTime: e.time,
                traintype: train.trainType,
                trainNumber: e.train,
                classes: train.classes,
                coach: train.coach);

            result.add(x);
          } catch (e) {
            print(e);
          }
        }
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
    result.sort(
      (a, b) {
        //convert time to double
        double toDouble(Result t) {
          TimeOfDay time = TimeOfDay(
              hour: int.parse(t.departureTime.split(":")[0]),
              minute: int.parse(t.departureTime.split(":")[1]));
          return time.hour + time.minute / 60.0;
        }

        return (toDouble(a) - toDouble(b)).toInt();
      },
    );
    return result;
  }

  static Future<List<StationTrainList>> getStationtable(String station) async {
    late List<Map<String, dynamic>> trainlist;
    await Future.wait<void>([
      _db!
          .query(_tableRoute,
              where: 'station=?', whereArgs: [station], orderBy: "train")
          .then((value) => trainlist = value)
    ]);
    print("get table");

    int i = 0;
    List<StationTrainList> datas = [];
    for (; i < trainlist.length; i++) {
      var data = Routes.fromJson(trainlist[i]);
      late String des, arr;
      //เช็คสถานีสุดท้ายขาเข้า
      if (line[int.parse(data.line) - 1].indexOf(station) != 0 &&
          int.parse(data.train) % 2 == 0) {
        des = line[int.parse(data.line) - 1].first;
        arr = line[int.parse(data.line) - 1].last;
      }
      //เช็คสถานีสุดท้ายขาออก
      else if (line[int.parse(data.line) - 1].indexOf(station) !=
              line[int.parse(data.line) - 1].length - 1 &&
          int.parse(data.train) % 2 != 0) {
        des = line[int.parse(data.line) - 1].last;
        arr = line[int.parse(data.line) - 1].first;
      } else {
        continue;
      }
      datas.add(StationTrainList(
          originStation: arr,
          destinationStation: des,
          trainNo: data.train,
          stationTime: data.time));
    }
    datas.sort(
      (a, b) {
        //convert time to double
        double toDouble(StationTrainList t) {
          TimeOfDay time = TimeOfDay(
              hour: int.parse(t.stationTime.split(":")[0]),
              minute: int.parse(t.stationTime.split(":")[1]));
          return time.hour + time.minute / 60.0;
        }

        return (toDouble(a) - toDouble(b)).toInt();
      },
    );
    return datas;
  }

  static Future<List<TrainTimetable>> getTraintable(String train) async {
    late List<Map<String, dynamic>> stationlist;
    await Future.wait<void>([
      _db!
          .query(_tableRoute,
              where: 'train=?', whereArgs: [train], orderBy: "train")
          .then((value) => stationlist = value)
    ]);
    print("get table");

    int i = 0;
    List<TrainTimetable> datas = [];
    for (; i < stationlist.length; i++) {
      var data = Routes.fromJson(stationlist[i]);
      late String station, deptime;
      //เช็คสถานีสุดท้ายขาเข้า
      if (line[int.parse(data.line) - 1].indexOf(data.station) != 0 &&
          int.parse(data.train) % 2 == 0) {
        station = data.station;
        deptime = data.time;
      }
      //เช็คสถานีสุดท้ายขาออก
      else if (line[int.parse(data.line) - 1].indexOf(data.station) !=
              line[int.parse(data.line) - 1].length - 1 &&
          int.parse(data.train) % 2 != 0) {
        station = data.station;
        deptime = data.time;
      } else {
        continue;
      }
      datas.add(TrainTimetable(station: station, deptime: deptime));
    }
    datas.sort(
      (a, b) {
        //convert time to double
        double toDouble(TrainTimetable t) {
          TimeOfDay time = TimeOfDay(
              hour: int.parse(t.deptime.split(":")[0]),
              minute: int.parse(t.deptime.split(":")[1]));
          return time.hour + time.minute / 60.0;
        }

        return (toDouble(a) - toDouble(b)).toInt();
      },
    );
    return datas;
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
                  time: time.elementAt(timeCounter)[0].toString(),
                  line: "$line");
              batch.insert(_tableRoute, route.toJson());
              //DBHelper.insertR(route);
              id++;
            }
            timeCounter++;
          }

          await batch.commit(noResult: true);
          print("finish line");
        }
      }
    }
    print("finish");
  }
}
