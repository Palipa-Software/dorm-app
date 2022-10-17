// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dorm_app/modules/food_list/food_list_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';

class FoodListScreen extends GetView<FoodListController> {
  @override
  Widget build(BuildContext context) {
    List foodListDay = [
      DayFoodListButton(
          Title: "Pazartesi",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Pazartesi", controller.goMondayBreakfast, controller.goMondayDinner);
          }),
      DayFoodListButton(
          Title: "Salı",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Salı", controller.goTuesdayBreakfast, controller.goTuesdayDinner);
          }),
      DayFoodListButton(
          Title: "Çarşamba",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Çarşamba", controller.goWednesdayBreakfast, controller.goWednesdayDinner);
          }),
      DayFoodListButton(
          Title: "Perşembe",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Perşembe", controller.goThursdayBreakfast, controller.goThursdayDinner);
          }),
      DayFoodListButton(
          Title: "Cuma",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Cuma", controller.goFridayBreakfast, controller.goFridayDinner);
          }),
      DayFoodListButton(
          Title: "Cumartesi",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Cumartesi", controller.goSaturdayBreakfast, controller.goSaturdayDinner);
          }),
      DayFoodListButton(
          Title: "Pazar",
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, "Pazar", controller.goSundayBreakfast, controller.goSundayDinner);
          }),
    ];
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100.w,
              height: 82.h,
              child: ListView.separated(
                  itemBuilder: (context, index) => foodListDay[index],
                  separatorBuilder: (context, index) => SizedBox(
                        height: 4.h,
                      ),
                  itemCount: foodListDay.length),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> mealBottomSheet(BuildContext context, String title, Function() BreakfastFunc, Function() DinnerFunc) {
    return showModalBottomSheet(
      elevation: 10,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 40.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp)),
          child: Padding(
            padding: AppPadding.projectPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inconsolata(
                      color: AppColors.white, fontSize: 22.sp, fontWeight: FontWeight.w700, letterSpacing: 12.sp),
                ),
                DayFoodListButton(
                  Title: "Kahvaltı",
                  FuncDayFoodListPageNavi: BreakfastFunc,
                ),
                DayFoodListButton(
                  Title: "Akşam Yemeği",
                  FuncDayFoodListPageNavi: DinnerFunc,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DayFoodListButton extends StatelessWidget {
  String Title;
  Function() FuncDayFoodListPageNavi;
  DayFoodListButton({
    Key? key,
    required this.Title,
    required this.FuncDayFoodListPageNavi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: FuncDayFoodListPageNavi,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(16.sp),
        child: Container(
          child: Center(
            child: Text(
              Title,
              style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 20.sp),
            ),
          ),
          decoration: BoxDecoration(color: AppColors.lakeView, borderRadius: BorderRadius.circular(16.sp)),
          width: 100.w,
          height: 8.h,
        ),
      ),
    );
  }
}

//Version 1.0.0'daki 2 günlük yemek widgeti
/*
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
*/