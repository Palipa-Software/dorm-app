import 'package:get/get.dart';

import 'today_breakfast_controller.dart';

class TodayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayBreakfastController>(() => TodayBreakfastController());
  }
}
