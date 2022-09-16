import 'package:get/get.dart';

import 'desserts_controller.dart';

class DessertsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DessertsController>(() => DessertsController());
  }
}
