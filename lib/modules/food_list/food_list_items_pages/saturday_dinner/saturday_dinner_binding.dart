import 'package:get/get.dart';
import 'saturday_dinner_controller.dart';

class SaturdayDinnerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaturdayDinnerController>(() => SaturdayDinnerController());
  }
}
