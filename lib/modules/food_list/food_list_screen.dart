// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:dorm_app/modules/food_list/food_list_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';

class FoodListScreen extends GetView<FoodListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.foodListTitle,
            style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: AppPadding.projectPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FoodListContainer(
                  title: AppStrings.todayFoodList,
                  breakfastFunc: controller.goTodayBreakfast,
                  dinnerFunc: controller.goTodayDinner),
              FoodListContainer(
                  title: AppStrings.tommorowFoodList,
                  breakfastFunc: controller.goTomorrowBreakfast,
                  dinnerFunc: controller.goTomorrowDinner),
            ],
          ),
        ));
  }
}

class FoodListContainer extends StatelessWidget {
  String title;
  Function() breakfastFunc;
  Function() dinnerFunc;
  FoodListContainer({
    Key? key,
    required this.title,
    required this.breakfastFunc,
    required this.dinnerFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: AppColors.lakeView,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            CustomFoodListButton(title: AppStrings.breakfast, func: breakfastFunc),
            CustomFoodListButton(title: AppStrings.mainCourse, func: dinnerFunc),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomFoodListButton extends StatelessWidget {
  String title;
  Function() func;
  CustomFoodListButton({
    Key? key,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.oceanNight,
      elevation: 10,
      borderRadius: BorderRadius.circular(16.sp),
      child: Bounceable(
        onTap: func,
        child: Container(
          alignment: Alignment.center,
          width: 100.w,
          height: 10.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp), color: AppColors.oceanNight),
          child: Text(
            title,
            style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 22.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
