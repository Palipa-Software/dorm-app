import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class FoodListController extends GetxController {
  void goTodayBreakfast() {
    Get.toNamed(Routes.TODAYBREAKFAST);
  }

  void goTodayDinner() {
    Get.toNamed(Routes.TODAYDINNER);
  }

  void goTomorrowBreakfast() {
    Get.toNamed(Routes.TOMORROWBREAKFAST);
  }

  void goTomorrowDinner() {
    Get.toNamed(Routes.TOMORROWDINNER);
  }
}
