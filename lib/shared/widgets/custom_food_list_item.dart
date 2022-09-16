import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CustomFoodListItem extends StatelessWidget {
  String foodName;
  String foodWeight;
  String foodPrice;
  CustomFoodListItem({
    Key? key,
    required this.foodName,
    required this.foodWeight,
    required this.foodPrice,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            foodName,
            style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp),
          ),
          Text(
            foodWeight + " Gram",
            style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp),
          ),
          Text(
            foodPrice + " TL",
            style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
