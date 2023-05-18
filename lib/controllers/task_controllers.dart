import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:train_planner/db/db_helper.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  final int planid;
  TaskController(this.planid);

  @override
  void onReady() {
    getTasks(planid);
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  //เอาข้อมูลจากตาราง
  void getTasks(int planid) async {
    List<Map<String, dynamic>> tasks = await DBHelper.query(planid);
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
    taskList.sort(
      (a, b) {
        var aa = a.date!.replaceAll('/', '-');
        var bb = b.date!.replaceAll('/', '-');
        DateFormat formatter = DateFormat("dd-MM-yyyy");
        DateTime formattedDateA = formatter.parse(aa);
        DateTime formattedDateB = formatter.parse(bb);
        return formattedDateA.compareTo(formattedDateB);
      },
    );
  }

  void delete(Task task) {
    DBHelper.delete(task);
    // var val = DBHelper.delete(task);
    // print(val);
  }
}
