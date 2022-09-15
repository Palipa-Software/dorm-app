import 'package:get/get.dart';
import 'loginHelp_controller.dart';

class LoginHelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginHelpController>(() => LoginHelpController());
  }
}
