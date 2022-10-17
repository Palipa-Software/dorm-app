import 'package:get/get.dart';

import 'thursday_breakfast_controller.dart';

class ThursdayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThursdayBreakfastController>(() => ThursdayBreakfastController());
  }
}
