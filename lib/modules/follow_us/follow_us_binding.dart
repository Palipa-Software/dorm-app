import 'package:get/get.dart';

import 'follow_us_controller.dart';

class FollowUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowUsController>(() => FollowUsController());
  }
}
