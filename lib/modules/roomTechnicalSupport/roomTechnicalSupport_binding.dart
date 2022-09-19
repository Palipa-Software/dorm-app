import 'package:dorm_app/modules/roomTechnicalSupport/roomTechnicalSupport_controller.dart';
import 'package:get/get.dart';

class RoomTechnicalSupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomTechnicalSupportController>(
        () => RoomTechnicalSupportController());
  }
}
