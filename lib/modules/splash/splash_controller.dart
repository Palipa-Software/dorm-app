import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../shared/utils/shared_preferences.dart';

class SplashController extends GetxController {
  final LoginController _controller = LoginController();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(milliseconds: 3000));
    Get.toNamed(Routes.LOGIN);
    await SharedPrefs.loginRead();
  }
}
