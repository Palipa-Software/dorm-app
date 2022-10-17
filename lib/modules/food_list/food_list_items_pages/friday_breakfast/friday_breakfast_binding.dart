import 'package:get/get.dart';

import 'friday_breakfast_controller.dart';

class FridayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FridayBreakfastController>(() => FridayBreakfastController());
  }
}
