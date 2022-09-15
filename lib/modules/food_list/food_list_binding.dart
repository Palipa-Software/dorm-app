import 'package:get/get.dart';

import 'food_list_controller.dart';

class FoodListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodListController>(() => FoodListController());
  }
}
