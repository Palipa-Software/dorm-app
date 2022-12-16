import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CustomRezervationPageInput extends StatelessWidget {
  CustomRezervationPageInput(
      {required this.controller,
      required this.icon,
      required this.hintText,
      this.readOnly,
      this.keyboardType});
  TextEditingController controller;
  IconData icon;
  String hintText;
  TextInputType? keyboardType;
  bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.oceanNight,
      style:
          GoogleFonts.inconsolata(color: AppColors.lakeView, fontSize: 17.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.sp),
        prefixIcon:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            size: 6.w,
            color: AppColors.lakeView,
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
    );
  }
}
