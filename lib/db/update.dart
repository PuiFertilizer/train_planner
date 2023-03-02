import 'package:train_planner/db/db_helper.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:io';
import 'package:train_planner/db/dataList.dart';
import '../models/route.dart';

class Updater {
  String trainPath = "assets/db/train.txt";
  RegExp reStname = RegExp(r'<b>(.*?)</b>', multiLine: true);
  RegExp reTrname = RegExp(r'([0-9]+)</a>', multiLine: true);
  RegExp reTime = RegExp(r'[0-9]{2}:[0-9]{2}|arrow', multiLine: true);

  //todo:make proper check today
  bool checkToday() {
    //final now = DateTime.now();
    //final today = DateTime(now.year, now.month, now.day);
    return true;
  }

  Future<void> updateTrain() async {
    for (int line = 1; line <= 7; line++) {
      for (int route = 1; route <= 2; route++) {
        String webPath =
            "https://ttsview.railway.co.th/SRT_Schedule2022.php?ln=th&line=$line&trip=$route";
        final webScraper = WebScraper(webPath);
        String pageHTML = webScraper.getPageContent();
        Iterable<RegExpMatch> stations = reStname.allMatches(pageHTML);
        Iterable<RegExpMatch> trains = reTrname.allMatches(pageHTML);
        Iterable<RegExpMatch> time = reTime.allMatches(pageHTML);
        int timeCounter = 1;
        for (var i in time) {
          if (i.groupNames.toString() != " ") {
            Route route = Route(
                id: timeCounter,
                train:
                    trains.elementAt((timeCounter % trains.length)).toString(),
                station: stations
                    .elementAt((timeCounter / stations.length - 1).round())
                    .toString(),
                time: time.elementAt(timeCounter - 1).toString());
            DBHelper.insertR(route);
          }
          timeCounter++;
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
