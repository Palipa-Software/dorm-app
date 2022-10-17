import 'package:get/get.dart';

import 'sunday_dinner_controller.dart';

class SundayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SundayDinnerController>(() => SundayDinnerController());
  }
}
