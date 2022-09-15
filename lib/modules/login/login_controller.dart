import 'package:dorm_app/shared/widgets/loading_animation.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class LoginController extends GetxController {
  RxBool isVisible = true.obs;

  void changeVisible() {
    isVisible.value = !isVisible.value;
  }

  void goHome() async {
    Get.to(LoadingAnimation());
    await Future.delayed(Duration(milliseconds: 2500));
    Get.toNamed(Routes.HOMEPAGE);
  }

  void goLoginHelp() {
    Get.toNamed(Routes.LOGINHELP);
  }
}
