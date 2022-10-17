import 'package:get/get.dart';

import 'wednesday_breakfast_controller.dart';

class WednesdayBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WednesdayBreakfastController>(() => WednesdayBreakfastController());
  }
}
