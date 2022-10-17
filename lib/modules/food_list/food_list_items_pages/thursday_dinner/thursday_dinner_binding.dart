import 'package:get/get.dart';

import 'thursday_dinner_controller.dart';

class ThursdayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThursdayDinnerController>(() => ThursdayDinnerController());
  }
}
