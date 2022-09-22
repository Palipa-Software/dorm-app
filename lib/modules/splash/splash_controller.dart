import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dorm_app/routes/app_pages.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/utils/shared_preferences.dart';

class SplashController extends GetxController {
  Rx<ConnectivityResult> _connectivityResult = ConnectivityResult.none.obs;
  Rx<Connectivity> _connectivity = Connectivity().obs;
  RxBool hasInternet = false.obs;

  @override
  void onInit() async {
    super.onInit();
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    _connectivityResult.value = await Connectivity().checkConnectivity();
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        hasInternet.value = status == InternetConnectionStatus.connected;
      },
    );
    debugPrint(hasInternet.value.toString());
    debugPrint(_connectivityResult.toString());
    _connectivity.value.onConnectivityChanged.listen(
      (result) async {
        _connectivityResult.value = result;
        if (_connectivityResult.value == ConnectivityResult.wifi ||
            _connectivityResult.value == ConnectivityResult.mobile) {
          await Future.delayed(Duration(milliseconds: 3000));
          Get.toNamed(Routes.LOGIN);
          await SharedPrefs.loginRead();
        } else if (_connectivityResult == ConnectivityResult.none) {
          Get.offAllNamed(Routes.LOADING);
          await Get.snackbar(
            "Internet Connection",
            "Network",
            duration: Duration(seconds: 5),
            backgroundColor: AppColors.sodaliteBlue,
            titleText: Text(
              "Bağlantı Sorunu",
              style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
            ),
            messageText: Text(
              "İnternet Bağlantınızı Kontrol Ediniz!!!",
              style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
            ),
          );
        }
        debugPrint(_connectivityResult.toString());
      },
    ).obs;

    if (_connectivityResult == ConnectivityResult.mobile || _connectivityResult == ConnectivityResult.wifi) {
      await Future.delayed(Duration(milliseconds: 3000));
      Get.toNamed(Routes.LOGIN);
      await SharedPrefs.loginRead();
    } else {
      Get.snackbar(
        "Internet Connection",
        "Network",
        duration: Duration(seconds: 5),
        backgroundColor: AppColors.oceanNight,
        titleText: Text(
          "Bağlantı Sorunu",
          style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
        messageText: Text(
          "İnternet Bağlantınızı Kontrol Ediniz!!!",
          style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
      );
    }
  }
}
