import 'package:dorm_app/shared/widgets/loading_animation.dart';
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

  void signOut() async {
    await auth.signOut();
    Get.to(LoadingAnimation());
    Get.toNamed(Routes.LOGIN);
  }
}
