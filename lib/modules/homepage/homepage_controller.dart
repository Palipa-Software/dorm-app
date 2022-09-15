import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomePageController extends GetxController {
  void goAnnouncement() {
    Get.toNamed(Routes.ANNOUNCEMENTS);
  }

  void goFoodList() {
    Get.toNamed(Routes.FOODLIST);
  }
}
