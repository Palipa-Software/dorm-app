import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_button.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_header_container.dart';
import 'package:dorm_app/shared/widgets/custom_login_page_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          CustomLoginPageHeaderContainer(path: AppStrings.loginIconPath),
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
                    hintText: AppStrings.email,
                    icon: Icons.mail_outlined,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomLoginPageInput(
                    controllerPassword: _controller.passwordController,
                    isEmail: false,
                    hintText: AppStrings.password,
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
