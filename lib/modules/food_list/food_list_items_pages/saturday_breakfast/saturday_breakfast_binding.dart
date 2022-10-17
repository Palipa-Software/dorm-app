import 'package:get/get.dart';

import 'saturday_breakfast_controller.dart';

class SaturdayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaturdayBreakfastController>(() => SaturdayBreakfastController());
  }
}
