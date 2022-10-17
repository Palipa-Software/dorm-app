import 'package:get/get.dart';

import 'wednesday_dinner_controller.dart';

class WednesdayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WednesdayDinnerController>(() => WednesdayDinnerController());
  }
}
