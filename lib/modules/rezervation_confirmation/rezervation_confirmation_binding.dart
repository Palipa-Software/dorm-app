import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:get/get.dart';

class RezervationConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RezervationConfirmationController>(
        () => RezervationConfirmationController());
  }
}
