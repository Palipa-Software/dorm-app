import 'dart:developer';

import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/modules/loginHelp/loginHelp_screen.dart';
import 'package:dorm_app/routes/app_pages.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:dorm_app/shared/widgets/circularProgress.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_button.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_header_container.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_input.dart';
import 'package:dorm_app/shared/widgets/loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController _controller = LoginController();
  LoginScreen({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;

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
                    controllerEmail: _controller.emailController,
                    isEmail: true,
                    hintText: "E-mail",
                    icon: Icons.mail_outlined,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomLoginPageInput(
                    controllerPassword: _controller.passwordController,
                    isEmail: false,
                    hintText: "Şifre",
                    icon: Icons.lock_outlined,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomLoginPageButton(
                    func: () async {
                      await _controller.login(
                        _controller.emailController.text.trim(),
                        _controller.passwordController.text.trim(),
                      );
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
