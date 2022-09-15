import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/login/login_binding.dart';
import 'package:dorm_app/modules/login/login_screen.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_binding.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_screen.dart';
import 'package:dorm_app/shared/widgets/loading_animation.dart';
import 'package:get/get.dart';

import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => HomePageScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.LOGINHELP,
      page: () => LoginHelpScreen(),
      binding: LoginHelpBinding(),
    ),
  ];
}
