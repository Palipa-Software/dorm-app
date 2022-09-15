import 'package:dorm_app/modules/announcement_detail/announcement_detail_controller.dart';
import 'package:get/get.dart';

class AnnouncementDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementDetailController>(
        () => AnnouncementDetailController());
  }
}
