import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
import 'package:dorm_app/shared/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomePageController extends GetxController {
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
    var data =
        await FirebaseFirestore.instance.collection("announcements").get();
    debugPrint(" Data sayısı " + data.size.toString());
  }
}
