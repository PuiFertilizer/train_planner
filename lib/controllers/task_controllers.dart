import 'package:get/get.dart';
import 'package:train_planner/db/db_helper.dart';
import '../models/task.dart';


class TaskController extends GetxController{

  @override
  void onReady(){
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async{
    return await DBHelper.insert(task);
  }

  //เอาข้อมูลจากตาราง
  void getTasks() async {
    List<Map<String,dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList()); //สงสัยจุดนี้ของ sqlite
  }

  void delete(Task task) {
    DBHelper.delete(task);
    // var val = DBHelper.delete(task);
    // print(val);
  }
}