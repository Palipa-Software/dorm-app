// ignore_for_file: public_member_api_docs, sort_constructors_first
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
            "Yemek Listesi",
            style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: AppPadding.projectPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FoodListContainer(
                  title: "Bugün Yemek Listesi",
                  breakfastFunc: controller.goTodayBreakfast,
                  dinnerFunc: controller.goTodayDinner),
              FoodListContainer(
                  title: "Yarın Yemek Listesi",
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
            CustomFoodListButton(title: "Kahvaltı", func: breakfastFunc),
            CustomFoodListButton(title: "Akşam Yemeği", func: dinnerFunc),
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
/*
Padding(
        padding: AppPadding.projectPadding,
        child: Container(
          width: 100.w,
          height: 85.h,
          child: ListView.separated(
            itemCount: foodButton.length,
            itemBuilder: (context, index) {
              return foodButton[index];
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 2.h,
            ),
          ),
        ),
      ),
      */