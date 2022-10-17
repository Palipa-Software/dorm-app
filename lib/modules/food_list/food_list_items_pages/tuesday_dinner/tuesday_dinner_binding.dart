import 'package:get/get.dart';

import 'tuesday_dinner_controller.dart';

class TuesdayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TuesdayDinnerController>(() => TuesdayDinnerController());
  }
}
