import 'package:get/get.dart';

import 'today_dinner_controller.dart';

class TodayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayDinnerController>(() => TodayDinnerController());
  }
}
