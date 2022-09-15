import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_screen.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_button.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_header_container.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_input.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController _controller = LoginController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomLoginPageHeaderContainer(path: "ic_login"),
          Positioned(
            bottom: 0,
            child: Container(
              width: 100.w,
              height: 50.h,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.sp),
                ),
                color: AppColors.lakeView,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CustomLoginPageInput(
                      isEmail: true,
                      hintText: "E-mail",
                      icon: Icons.mail_outlined),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomLoginPageInput(
                    isEmail: false,
                    hintText: "Şifre",
                    icon: Icons.lock_outlined,

                  TextFormField(
                    cursorColor: AppColors.oceanNight,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.inconsolata(color: AppColors.oceanNight, fontSize: 17.sp),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(18.sp),
                      prefixIcon: Icon(
                        Icons.mail_outlined,
                        size: 6.w,
                        color: AppColors.oceanNight,
                      ),
                      hintText: "E-mail",
                      hintStyle: GoogleFonts.inconsolata(color: AppColors.oceanNight, fontSize: 16.sp),
                      fillColor: AppColors.white,
                      filled: true,
                      border:
                          UnderlineInputBorder(borderRadius: BorderRadius.circular(18.sp), borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(
                    () {
                      return TextFormField(
                        cursorColor: AppColors.oceanNight,
                        obscureText: _controller.isVisible.value,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        style: GoogleFonts.inconsolata(color: AppColors.oceanNight, fontSize: 17.sp),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.sp),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            size: 6.w,
                            color: AppColors.oceanNight,
                          ),
                          suffixIcon: Bounceable(
                            onTap: () {
                              _controller.changeVisible();
                            },
                            child: Icon(
                              _controller.isVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.oceanNight,
                              size: 6.w,
                            ),
                          ),
                          hintText: "Şifre",
                          hintStyle: GoogleFonts.inconsolata(color: AppColors.oceanNight, fontSize: 16.sp),
                          fillColor: AppColors.white,
                          filled: true,
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(18.sp), borderSide: BorderSide.none),
                        ),
                      );
                    },

                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomLoginPageButton(
                    func: () {
                      _controller.goHome();
                    },
                    isTextButton: false,
                    title: AppStrings.loginBtnText,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomLoginPageButton(
                    func: () {
                      _controller.goLoginHelp();
                    },
                    isTextButton: true,
                    title: AppStrings.loginTextBtnTitle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
