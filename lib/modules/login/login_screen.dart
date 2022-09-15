import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController _controller = LoginController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 25.w,
            child: Container(
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ic_login.png"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 100.w,
              height: 45.h,
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
                  Bounceable(
                    onTap: () {
                      _controller.goHome();
                    },
                    child: Container(
                      padding: EdgeInsets.all(18.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.sp),
                        color: AppColors.oceanNight,
                      ),
                      width: 100.w,
                      child: Text(
                        "Giriş Yap",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inconsolata(
                          color: AppColors.white,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w, top: 2.h),
                      child: Text(
                        "Giriş yapmakta sorun mu yaşıyorsunuz?",
                        style: GoogleFonts.inconsolata(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
