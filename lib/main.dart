import 'package:dorm_app/routes/app_pages.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:dorm_app/shared/utils/localizatons.dart';
import 'package:dorm_app/shared/utils/services.dart';
import 'package:dorm_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);

  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return OverlaySupport.global(
        child: GetMaterialApp(
          navigatorKey: Grock.navigationKey,
          scaffoldMessengerKey: Grock.scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          enableLog: false,
          title: AppStrings.appTitle,
          defaultTransition: Transition.downToUp,
          getPages: AppPages.routes,
          initialRoute: Routes.SPLASH,
          smartManagement: SmartManagement.keepFactory,
          theme: ThemeConfig.lightTheme,
          builder: EasyLoading.init(),
          locale: Locale("tr", "TR"),
          translations: LocaleString(),
        ),
      );
    });
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
