import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CustomFoodListItem extends StatelessWidget {
  String foodName;
  String foodWeight;

  CustomFoodListItem({
    Key? key,
    required this.foodName,
    required this.foodWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
        color: AppColors.lakeView,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                foodName,
                style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                foodWeight,
                style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
