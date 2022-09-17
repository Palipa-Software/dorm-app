import 'package:get/get.dart';
import 'soups_controller.dart';

class SoupsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SoupsController>(() => SoupsController());
  }
}
