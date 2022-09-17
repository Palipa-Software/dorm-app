import 'package:get/get.dart';

import 'breakfast_controller.dart';

class BreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreakfastController>(() => BreakfastController());
  }
}
