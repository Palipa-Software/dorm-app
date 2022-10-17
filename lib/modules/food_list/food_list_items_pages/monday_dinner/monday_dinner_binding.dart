import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_breakfast/monday_breakfast_controller.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_dinner/monday_dinner_controller.dart';
import 'package:get/get.dart';

class MondayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MondayDinnerController>(() => MondayDinnerController());
  }
}
