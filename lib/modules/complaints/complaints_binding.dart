import 'package:dorm_app/modules/complaints/complaints_controller.dart';
import 'package:get/get.dart';

class ComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintsController>(() => ComplaintsController());
  }
}
