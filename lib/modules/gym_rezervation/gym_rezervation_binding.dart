import 'package:get/get.dart';

import 'gym_rezervation_controller.dart';

class GymRezervationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GymRezervationController>(() => GymRezervationController());
  }
}
