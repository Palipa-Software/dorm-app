import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/login/login_controller.dart';
import '../constants/colors.dart';

class CustomLoginPageInput extends GetView<LoginController> {
  final LoginController _controller = LoginController();
  String hintText;
  bool isEmail;
  int isMessage;
  IconData icon;
  TextInputType? keyboard;
  TextInputAction? action;
  TextEditingController? controllerEmail;
  TextEditingController? controllerPassword;
  CustomLoginPageInput(
      {required this.isEmail,
      this.controllerEmail,
      this.controllerPassword,
      required this.hintText,
      required this.icon,
      this.keyboard,
      this.action,
      this.isMessage = 1,
      super.key});

  @override
  Widget build(BuildContext context) {
    return isEmail
        ? TextFormField(
            controller: controllerEmail,
            cursorColor: AppColors.oceanNight,
            keyboardType: keyboard ?? TextInputType.emailAddress,
            textInputAction: action ?? TextInputAction.next,
            maxLines: isMessage,
            style: GoogleFonts.inconsolata(
                color: AppColors.oceanNight, fontSize: 17.sp),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18.sp),
              prefixIcon: Column(
                  mainAxisAlignment: isMessage == 1
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: 6.w,
                      color: AppColors.oceanNight,
                    ),
                  ]),
              hintText: hintText,
              hintStyle: GoogleFonts.inconsolata(
                color: AppColors.oceanNight,
                fontSize: 16.sp,
              ),
              fillColor: AppColors.white,
              filled: true,
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(18.sp),
                  borderSide: BorderSide.none),
            ),
          )
        : Obx(
            () {
              return TextFormField(
                controller: controllerPassword,
                cursorColor: AppColors.oceanNight,
                obscureText: _controller.isVisible.value,
                obscuringCharacter: "*",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.inconsolata(
                    color: AppColors.oceanNight, fontSize: 17.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(18.sp),
                  prefixIcon: Icon(
                    icon,
                    size: 6.w,
                    color: AppColors.oceanNight,
                  ),
                  suffixIcon: Bounceable(
                    onTap: () {
                      _controller.changeVisible();
                    },
                    child: Icon(
                      _controller.isVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.oceanNight,
                      size: 6.w,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.inconsolata(
                      color: AppColors.oceanNight, fontSize: 16.sp),
                  fillColor: AppColors.white,
                  filled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(18.sp),
                      borderSide: BorderSide.none),
                ),
              );
            },
          );
  }
}
