import 'package:dorm_app/modules/complaints/complaints_controller.dart';
import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/strings.dart';
import '../../shared/widgets/custom_login_page_button.dart';
import '../../shared/widgets/custom_login_page_input.dart';

class ComplaintsScreen extends GetView<ComplaintsController> {
  final LoginController _controller = LoginController();
  ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Şikayet",
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
                "Şikayet Formu",
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
                controllerEmail: controller.subjectOfComplaint,
                isEmail: true,
                hintText: "Şikayet Konusu",
                icon: Icons.warning_amber_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.complaintsUnit,
                isEmail: true,
                hintText: "Şikayet Birimi",
                icon: Icons.system_security_update_warning_outlined,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                isReadOnly: true,
                controllerEmail: controller.initial(_controller.auth.currentUser!.email),
                isEmail: true,
                hintText: "E-mail",
                icon: Icons.email_outlined,
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                controllerEmail: controller.complaintText,
                isEmail: true,
                hintText: "Şikayetinizi belirtiniz",
                icon: Icons.message_outlined,
                action: TextInputAction.done,
                isMessage: 3,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageButton(
                func: () {
                  controller.createHomePageComplaint(
                      nameSurname: controller.nameSurname.text,
                      subjectOfComplaint: controller.subjectOfComplaint.text,
                      complaintsUnit: controller.complaintsUnit.text,
                      complaintText: controller.complaintText.text,
                      email: _controller.auth.currentUser!.email.toString());
                  controller.nameSurname.text = "";
                  controller.subjectOfComplaint.text = "";
                  controller.complaintsUnit.text = "";
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
