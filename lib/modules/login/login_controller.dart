import 'package:get/get.dart';

import '../../routes/routes.dart';

class LoginController extends GetxController {
  RxBool isVisible = true.obs;

  void changeVisible() {
    isVisible.value = !isVisible.value;
  }

  void goHome() async {
    Get.toNamed(Routes.SPLASH);
    await Future.delayed(Duration(milliseconds: 2500));
    Get.toNamed(Routes.HOMEPAGE);
  }
}
