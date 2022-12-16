import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_pages.dart';

class SharedPrefs {
  final LoginController controller = LoginController();
  final RezervationConfirmationController rezervationConfirmationController =
      RezervationConfirmationController();
  static loginSaver(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  static loginRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = await prefs.getString('email') ?? "";
    String? password = await prefs.getString('password') ?? "";
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.offAllNamed(Routes.HOMEPAGE);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  static Future<void> setString(String key, String value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<void> setBool(String key, bool? value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value!);
  }

  static Future<bool?> getBool(String? key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key!);
  }

  static Future<String?> getString(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
