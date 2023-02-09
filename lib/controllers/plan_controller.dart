import 'package:get/get.dart';
import 'package:train_planner/db/db_planHelper.dart';
import 'package:train_planner/models/plan_model.dart';
import '../models/task.dart';

class PlanController extends GetxController {
  @override
  void onReady() {
    getPlans();
    super.onReady();
  }

  var planList = <Plann>[].obs;

  Future<int> addPlan({Plann? plann}) async {
    return await PlanDBHelper.createPlan(plann);
  }

  //

  Future<int> editPlan({Plann? plann}) async {
    return await PlanDBHelper.editPlan(plann);
  }

  //เอาข้อมูลจากตาราง
  void getPlans() async {
    List<Map<String, dynamic>> plans = await PlanDBHelper.queryPlan();
    planList.assignAll(plans
        .map((data) => Plann.fromJson(data))
        .toList()); //สงสัยจุดนี้ของ sqlite
  }

  void delete(Plann plann) {
    PlanDBHelper.deletePlan(plann);
  }
}
