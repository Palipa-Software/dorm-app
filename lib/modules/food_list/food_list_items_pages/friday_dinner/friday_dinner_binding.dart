import 'package:dorm_app/modules/food_list/food_list_items_pages/friday_dinner/friday_dinner_controller.dart';
import 'package:get/get.dart';

class FridayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FridayDinnerController>(() => FridayDinnerController());
  }
}
