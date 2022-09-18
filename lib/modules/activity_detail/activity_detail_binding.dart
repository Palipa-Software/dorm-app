import 'package:dorm_app/modules/activity_detail/activity_detail_controller.dart';
import 'package:get/get.dart';

class ActivityDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityDetailController>(() => ActivityDetailController());
  }
}
