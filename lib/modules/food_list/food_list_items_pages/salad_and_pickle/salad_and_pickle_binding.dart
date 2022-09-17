import 'package:dorm_app/modules/food_list/food_list_items_pages/salad_and_pickle/salad_and_pickle_controller.dart';
import 'package:get/get.dart';

class SaladAndPickleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaladAndPickleController>(() => SaladAndPickleController());
  }
}
