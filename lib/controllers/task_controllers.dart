import 'package:get/get.dart';
import 'package:train_planner/db/db_planHelper.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  late int planid;
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  TaskController(this.planid);
  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await PlanDBHelper.insertTask(task);
  }

  //

  Future<int> editTask({Task? task}) async {
    return await PlanDBHelper.editTask(task);
  }

  //เอาข้อมูลจากตาราง
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await PlanDBHelper.queryTask(planid);
    taskList.assignAll(tasks
        .map((data) => Task.fromJson(data))
        .toList()); //สงสัยจุดนี้ของ sqlite
  }

  void delete(Task task) {
    PlanDBHelper.deleteTask(task);
    // var val = TaskDBHelper.delete(task);
    // print(val);
  }
}
