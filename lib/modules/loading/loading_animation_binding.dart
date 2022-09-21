import 'package:dorm_app/modules/loading/loading_animation_controller.dart';
import 'package:get/get.dart';

class LoadingAnimationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingAnimationController>(() => LoadingAnimationController());
  }
}
