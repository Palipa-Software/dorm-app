import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/utils/services.dart';
import 'package:dorm_app/shared/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../routes/app_pages.dart';

class HomePageController extends GetxController {
  late BannerAd staticAd;
  static const AdRequest request = AdRequest();
  static const String unitId = "ca-app-pub-1614405033690708/8253163068";
  RxBool staticAdLoaded = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadStaticAd();
  }

  void loadStaticAd() {
    staticAd = BannerAd(
        size: AdSize.banner,
        adUnitId: unitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            staticAdLoaded.value = true;
            print("Çalıştı");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print("büyük hata $error");
          },
        ),
        request: request);
    staticAd.load();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void goAnnouncement() {
    Get.toNamed(Routes.ANNOUNCEMENTS);
  }

  void goFoodList() {
    Get.toNamed(Routes.FOODLIST);
  }

  void goComplaint() {
    Get.toNamed(Routes.COMPLAINT);
  }

  void goRoomTechSupport() {
    Get.toNamed(Routes.ROOMTECHNICALSUPPORT);
  }

  void goActivity() {
    Get.toNamed(Routes.ACTIVITY);
  }

  void goFollowUs() {
    Get.toNamed(Routes.FOLLOWUS);
  }

  void goForms() {
    Get.toNamed(Routes.FORMS);
  }

  void goGym() {
    Get.toNamed(Routes.GYMREZERVATION);
  }

  void signOut() async {
    await auth.signOut();
    SharedPrefs.loginSaver("", "");
    Get.offAllNamed(Routes.LOADING);
    await Future.delayed(Duration(milliseconds: 2000));
    Get.offAllNamed(Routes.LOGIN);
  }

  void dataRead() async {
    var data = await FirebaseFirestore.instance.collection("announcements").get();
    debugPrint(" Data sayısı " + data.size.toString());
  }
}
