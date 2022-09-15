import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_button.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginHelpScreen extends GetView<LoginController> {
  final LoginHelpController _controller = LoginHelpController();
  LoginHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.loginHelpTitle,
                style: GoogleFonts.inconsolata(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomLoginPageButton(
                func: () {
                  _controller.goBack();
                },
                isTextButton: true,
                title: AppStrings.goBackText,
              )
            ],
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
                AppStrings.fixingProblem,
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
                isEmail: true,
                hintText: AppStrings.nameSurname,
                icon: Icons.people_outline,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                isEmail: true,
                hintText: AppStrings.roomInfo,
                icon: Icons.bed_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                isEmail: true,
                hintText: AppStrings.phoneNumber,
                icon: Icons.phone_outlined,
                keyboard: TextInputType.number,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageInput(
                isEmail: true,
                hintText: AppStrings.loginProblem,
                icon: Icons.message_outlined,
                action: TextInputAction.done,
                isMessage: 3,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomLoginPageButton(
                func: () {},
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
