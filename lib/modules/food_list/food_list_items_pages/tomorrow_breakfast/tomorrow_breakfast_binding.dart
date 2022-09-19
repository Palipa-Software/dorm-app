import 'package:get/get.dart';

import 'tomorrow_breakfast_controller.dart';

class TomorrowBreakfastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TomorrowBreakfastController>(() => TomorrowBreakfastController());
  }
}
