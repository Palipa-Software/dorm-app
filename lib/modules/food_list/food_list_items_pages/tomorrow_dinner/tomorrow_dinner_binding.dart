import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_dinner/tomorrow_dinner_controller.dart';
import 'package:get/get.dart';

class TomorrowDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TomorrowDinnerController>(() => TomorrowDinnerController());
  }
}
