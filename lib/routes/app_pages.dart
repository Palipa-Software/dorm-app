import 'package:dorm_app/modules/announcement_detail/announcement_detail_binding.dart';
import 'package:dorm_app/modules/announcement_detail/announcement_detail_screen.dart';
import 'package:dorm_app/modules/announcements/announcements_binding.dart';
import 'package:dorm_app/modules/announcements/announcements_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/breakfast/breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/breakfast/breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/desserts/desserts_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/desserts/desserts_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/drinks/drinks_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/drinks/drinks_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/main_course/main_course_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/main_course/main_course_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/rice_and_pasta/rice_and_pasta_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/rice_and_pasta/rice_and_pasta_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/salad_and_pickle/salad_and_pickle_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/salad_and_pickle/salad_and_pickle_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/soups/soups_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/soups/soups_screen.dart';
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
      name: Routes.BREAKFAST,
      page: () => BreakfastScreen(),
      binding: BreakfastBinding(),
    ),
    GetPage(
      name: Routes.DESSERTS,
      page: () => DessertsScreen(),
      binding: DessertsBinding(),
    ),
    GetPage(
      name: Routes.DRINKS,
      page: () => DrinksScreen(),
      binding: DrinksBinding(),
    ),
    GetPage(
      name: Routes.MAINCOURSE,
      page: () => MainCourseScreen(),
      binding: MainCourseBinding(),
    ),
    GetPage(
      name: Routes.RICEANDPASTA,
      page: () => RiceAndPastaScreen(),
      binding: RiceAndPastaBinding(),
    ),
    GetPage(
      name: Routes.SALADANDPICKLE,
      page: () => SaladAndPickleScreen(),
      binding: SaladAndPickleBinding(),
    ),
    GetPage(
      name: Routes.SOUPS,
      page: () => SoupsScreen(),
      binding: SoupsBinding(),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENTDETAIL,
      page: () => AnnouncementDetailScreen(),
      binding: AnnouncementDetailBinding(),
    ),
  ];
}
