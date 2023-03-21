import 'package:train_planner/db/db_helper.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:io';
import 'package:train_planner/db/dataList.dart';
import '../models/route.dart';

class Updater {
  String trainPath = "assets/db/train.txt";
  RegExp reStname = RegExp(r'(?<=<b>)(.*?)(?=</b>)', multiLine: true);
  RegExp reTrname = RegExp(r'([0-9]{1,4}(?=</a>))', multiLine: true);
  RegExp reTime = RegExp(r'[0-9]{2}:[0-9]{2}|arrow', multiLine: true);

  //todo:make proper check today
  bool checkToday() {
    //final now = DateTime.now();
    //final today = DateTime(now.year, now.month, now.day);
    return true;
  }

  Future<void> updateTrain() async {
    int id = 1;
    for (int line = 1; line <= 1; line++) {
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
              DBHelper.insertR(route);
              id++;
            }
            timeCounter++;
          }
        }
      }
    }
  }

  Future<void> autoupdateTrain() async {
    if (await File(trainPath).exists()) {
      if (checkToday()) {
        return;
      }
    }
    updateTrain();
  }
}
