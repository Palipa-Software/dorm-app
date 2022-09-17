import 'package:dorm_app/modules/food_list/food_list_items_pages/main_course/main_course_controller.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/rice_and_pasta/rice_and_pasta_controller.dart';
import 'package:get/get.dart';

class RiceAndPastaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiceAndPastaController>(() => RiceAndPastaController());
  }
}
