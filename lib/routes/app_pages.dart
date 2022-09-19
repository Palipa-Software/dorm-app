import 'package:dorm_app/modules/activity/activity_binding.dart';
import 'package:dorm_app/modules/activity/activity_screen.dart';
import 'package:dorm_app/modules/activity_detail/activity_detail_binding.dart';
import 'package:dorm_app/modules/activity_detail/activity_detail_screen.dart';
import 'package:dorm_app/modules/announcement_detail/announcement_detail_binding.dart';
import 'package:dorm_app/modules/announcement_detail/announcement_detail_screen.dart';
import 'package:dorm_app/modules/announcements/announcements_binding.dart';
import 'package:dorm_app/modules/announcements/announcements_screen.dart';
import 'package:dorm_app/modules/complaints/complaints_binding.dart';
import 'package:dorm_app/modules/complaints/complaints_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/today_breakfast/today_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/today_breakfast/today_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/today_dinner/today_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/today_dinner/today_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_breakfast/tomorrow_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_breakfast/tomorrow_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_dinner/tomorrow_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_dinner/tomorrow_dinner_screen.dart';

import 'package:dorm_app/modules/food_list/food_list_screen.dart';
import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/login/login_binding.dart';
import 'package:dorm_app/modules/login/login_screen.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_binding.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_screen.dart';
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
    GetPage(
      name: Routes.ANNOUNCEMENTS,
      page: () => AnnouncementsScreen(),
      binding: AnnouncementsBinding(),
    ),
    GetPage(
      name: Routes.FOODLIST,
      page: () => FoodListScreen(),
      binding: FoodListBinding(),
    ),
    GetPage(
      name: Routes.TODAYBREAKFAST,
      page: () => TodayBreakfastScreen(),
      binding: TodayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.TODAYDINNER,
      page: () => TodayDinnerScreen(),
      binding: TodayDinnerBinding(),
    ),
    GetPage(
      name: Routes.TOMORROWBREAKFAST,
      page: () => TomorrowBreakfastScreen(),
      binding: TomorrowBreakfastBinding(),
    ),
    GetPage(
      name: Routes.TOMORROWDINNER,
      page: () => TomorrowDinnerScreen(),
      binding: TomorrowDinnerBinding(),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENTDETAIL,
      page: () => AnnouncementDetailScreen(),
      binding: AnnouncementDetailBinding(),
    ),
    GetPage(
      name: Routes.ACTIVITY,
      page: () => ActivityScreen(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: Routes.ACTIVITYDETAIL,
      page: () => ActivityDetailScreen(),
      binding: ActivityDetailBinding(),
    ),
    GetPage(
      name: Routes.COMPLAINT,
      page: () => ComplaintsScreen(),
      binding: ComplaintBinding(),
    ),
  ];
}
