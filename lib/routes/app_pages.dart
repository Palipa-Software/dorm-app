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
import 'package:dorm_app/modules/follow_us/follow_us_binding.dart';
import 'package:dorm_app/modules/follow_us/follow_us_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/friday_breakfast/friday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/friday_breakfast/friday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/friday_dinner/friday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/friday_dinner/friday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_breakfast/monday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_breakfast/monday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_dinner/monday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_dinner/monday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/saturday_breakfast/saturday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/saturday_breakfast/saturday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/saturday_dinner/saturday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/saturday_dinner/saturday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/sunday_breakfast/sunday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/sunday_breakfast/sunday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/sunday_dinner/sunday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/sunday_dinner/sunday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/thursday_breakfast/thursday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/thursday_breakfast/thursday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/thursday_dinner/thursday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/thursday_dinner/thursday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tuesday_breakfast/tuesday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tuesday_breakfast/tuesday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tuesday_dinner/tuesday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tuesday_dinner/tuesday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/wednesday_breakfast/wednesday_breakfast_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/wednesday_breakfast/wednesday_breakfast_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/wednesday_dinner/wednesday_dinner_binding.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/wednesday_dinner/wednesday_dinner_screen.dart';
import 'package:dorm_app/modules/food_list/food_list_screen.dart';
import 'package:dorm_app/modules/forms/fomrs_binding.dart';
import 'package:dorm_app/modules/forms/forms_screen.dart';
import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/loading/loading_animation.dart';
import 'package:dorm_app/modules/loading/loading_animation_binding.dart';
import 'package:dorm_app/modules/login/login_binding.dart';
import 'package:dorm_app/modules/login/login_screen.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_binding.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_binding.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
import 'package:dorm_app/modules/roomTechnicalSupport/roomTechnicalSupport_binding.dart';
import 'package:dorm_app/modules/roomTechnicalSupport/roomTechnicalSupport_screen.dart';
import 'package:get/get.dart';
import '../modules/gym_rezervation/gym_rezervation_binding.dart';
import '../modules/gym_rezervation/gym_rezervation_screen.dart';
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
      name: Routes.LOADING,
      page: () => LoadingAnimation(),
      binding: LoadingAnimationBinding(),
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
    GetPage(
      name: Routes.ROOMTECHNICALSUPPORT,
      page: () => RoomTechnicalSupportScreen(),
      binding: RoomTechnicalSupportBinding(),
    ),
    GetPage(
      name: Routes.FOLLOWUS,
      page: () => FollowUsScreen(),
      binding: FollowUsBinding(),
    ),
    //Foods
    GetPage(
      name: Routes.FOODLIST,
      page: () => FoodListScreen(),
      binding: FoodListBinding(),
    ),
    GetPage(
      name: Routes.MONDAYBREAKFAST,
      page: () => MondayBreakfastScreen(),
      binding: MondayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.MONDAYDINNER,
      page: () => MondayDinnerScreen(),
      binding: MondayDinnerBinding(),
    ),
    GetPage(
      name: Routes.TUESDAYBREAKFAST,
      page: () => TuesdayBreakfastScreen(),
      binding: TuesdayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.TUESDAYDINNER,
      page: () => TuesdayDinnerScreen(),
      binding: TuesdayDinnerBinding(),
    ),
    GetPage(
      name: Routes.WEDNESDAYBREAKFAST,
      page: () => WednesdayBreakfastScreen(),
      binding: WednesdayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.WEDNESDAYDINNER,
      page: () => WednesdayDinnerScreen(),
      binding: WednesdayDinnerBinding(),
    ),
    GetPage(
      name: Routes.THURSDAYBREAKFAST,
      page: () => ThursdayBreakfastScreen(),
      binding: ThursdayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.THURSDAYDINNER,
      page: () => ThursdayDinnerScreen(),
      binding: ThursdayDinnerBinding(),
    ),
    GetPage(
      name: Routes.FRIDAYBREAKFAST,
      page: () => FridayBreakfastScreen(),
      binding: FridayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.FRIDAYDINNER,
      page: () => FridayDinnerScreen(),
      binding: FridayDinnerBinding(),
    ),
    GetPage(
      name: Routes.SATURDAYBREAKFAST,
      page: () => SaturdayBreakfastScreen(),
      binding: SaturdayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.SATURDAYDINNER,
      page: () => SaturdayDinnerScreen(),
      binding: SaturdayDinnerBinding(),
    ),
    GetPage(
      name: Routes.SUNDAYBREAKFAST,
      page: () => SundayBreakfastScreen(),
      binding: SundayBreakfastBinding(),
    ),
    GetPage(
      name: Routes.SUNDAYDINNER,
      page: () => SundayDinnerScreen(),
      binding: SundayDinnerBinding(),
    ),
    GetPage(
      name: Routes.FORMS,
      page: () => FormsScreen(),
      binding: FormsBinding(),
    ),
    GetPage(
      name: Routes.GYMREZERVATION,
      page: () => GymRezervationScreen(),
      binding: GymRezervationBinding(),
    ),
    GetPage(
      name: Routes.REZERVATIONSHOWSCREEN,
      page: () => RezervationShowScreen(),
      binding: RezervationConfirmationBinding(),
    ),
  ];
}
