import 'package:get/get.dart';

import 'drinks_controller.dart';

class DrinksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrinksController>(() => DrinksController());
  }
}
