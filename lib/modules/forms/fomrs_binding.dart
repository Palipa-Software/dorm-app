import 'package:get/get.dart';

import 'forms_controller.dart';

class FormsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormsController>(() => FormsController());
  }
}
