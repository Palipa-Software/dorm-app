import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/roomTechnicalSupport/roomTechnicalSupport_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/strings.dart';
import '../../shared/widgets/custom_login_page_button.dart';
import '../../shared/widgets/custom_login_page_input.dart';

class RoomTechnicalSupportScreen
    extends GetView<RoomTechnicalSupportController> {
  final LoginController _controller = LoginController();
  RoomTechnicalSupportController controller =
      Get.put(RoomTechnicalSupportController());
  RoomTechnicalSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.roomTechSupportTitle,
            style: GoogleFonts.inconsolata(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 80.h,
          margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.roomTechSupportFormTitle,
                style: GoogleFonts.inconsolata(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.nameSurname,
                isEmail: true,
                hintText: AppStrings.nameSurname,
                icon: Icons.people_outline,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                isReadOnly: true,
                controllerEmail:
                    controller.initial(_controller.auth.currentUser!.email),
                isEmail: true,
                hintText: AppStrings.email,
                icon: Icons.email_outlined,
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.roomInfo,
                isEmail: true,
                hintText: AppStrings.roomInfo,
                icon: Icons.bed_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.subjectOfComplaint,
                isEmail: true,
                hintText: AppStrings.subjectOfComplaints,
                icon: Icons.warning_amber_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.complaintText,
                isEmail: true,
                hintText: AppStrings.problemText,
                icon: Icons.message_outlined,
                action: TextInputAction.done,
                isMessage: 3,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageButton(
                func: () {
                  controller.createRoomTechSupport(
                      nameSurname: controller.nameSurname.text,
                      roomInfo: controller.roomInfo.text,
                      email: _controller.auth.currentUser!.email.toString(),
                      subjectOfComplaint: controller.subjectOfComplaint.text,
                      complaintText: controller.complaintText.text);
                  controller.nameSurname.text = "";
                  controller.roomInfo.text = "";
                  controller.subjectOfComplaint.text = "";
                  controller.complaintText.text = "";
                },
                isTextButton: false,
                title: AppStrings.loginHelpBtnText,
                color: AppColors.lakeView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
