import 'package:dorm_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(milliseconds: 3000));
    Get.toNamed(Routes.HOMEPAGE);
  }
}
