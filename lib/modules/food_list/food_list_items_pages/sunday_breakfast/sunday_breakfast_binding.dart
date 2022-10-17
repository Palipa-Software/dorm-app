import 'package:get/get.dart';

import 'sunday_breakfast_controller.dart';

class SundayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SundayBreakfastController>(() => SundayBreakfastController());
  }
}
