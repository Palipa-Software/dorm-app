import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class FoodListController extends GetxController {
  void goBreakfast() {
    Get.toNamed(Routes.BREAKFAST);
  }

  void goDeserts() {
    Get.toNamed(Routes.DESSERTS);
  }

  void goDrinks() {
    Get.toNamed(Routes.DRINKS);
  }

  void goMainCourse() {
    Get.toNamed(Routes.MAINCOURSE);
  }

  void goRiceAndPasta() {
    Get.toNamed(Routes.RICEANDPASTA);
  }

  void goSaladAndPickle() {
    Get.toNamed(Routes.SALADANDPICKLE);
  }

  void goSoups() {
    Get.toNamed(Routes.SOUPS);
  }
}
