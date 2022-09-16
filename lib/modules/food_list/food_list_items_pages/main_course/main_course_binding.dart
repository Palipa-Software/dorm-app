import 'package:dorm_app/modules/food_list/food_list_items_pages/main_course/main_course_controller.dart';
import 'package:get/get.dart';

class MainCourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainCourseController>(() => MainCourseController());
  }
}
