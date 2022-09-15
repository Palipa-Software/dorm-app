import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import 'CustomSvgAsset.dart';

// ignore: must_be_immutable
class CustomHomePageMenuButton extends StatelessWidget {
  String path;
  String title;
  Function() func;
  CustomHomePageMenuButton({
    Key? key,
    required this.path,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: func,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(16.sp),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSvgAsset(path: path),
              Text(
                title,
                style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.lakeView,
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
      ),
    );
  }
}
