import 'package:get/get.dart';

import 'tuesday_breakfast_controller.dart';

class TuesdayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TuesdayBreakfastController>(() => TuesdayBreakfastController());
  }
}
