import 'package:dorm_app/modules/announcements/announcements_controller.dart';
import 'package:get/get.dart';

class AnnouncementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementsController>(() => AnnouncementsController());
  }
}
