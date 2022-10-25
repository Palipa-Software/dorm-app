// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dorm_app/modules/food_list/food_list_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';

class FoodListScreen extends GetView<FoodListController> {
  List days = [
    "Pazartesi",
    "Salı",
    "Çarşamba",
    "Perşembe",
    "Cuma",
    "Cumartesi",
    "Pazar"
  ];
  List foodListDay = [];
  @override
  Widget build(BuildContext context) {
    foodListDay = [
      DayFoodListButton(
          index: 0,
          Title: days[0],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[0], controller.goMondayBreakfast,
                controller.goMondayDinner);
          }),
      DayFoodListButton(
          index: 1,
          Title: days[1],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[1], controller.goTuesdayBreakfast,
                controller.goTuesdayDinner);
          }),
      DayFoodListButton(
          index: 2,
          Title: days[2],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[2], controller.goWednesdayBreakfast,
                controller.goWednesdayDinner);
          }),
      DayFoodListButton(
          index: 3,
          Title: days[3],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[3], controller.goThursdayBreakfast,
                controller.goThursdayDinner);
          }),
      DayFoodListButton(
          index: 4,
          Title: days[4],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[4], controller.goFridayBreakfast,
                controller.goFridayDinner);
          }),
      DayFoodListButton(
          index: 5,
          Title: days[5],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[5], controller.goSaturdayBreakfast,
                controller.goSaturdayDinner);
          }),
      DayFoodListButton(
          index: 6,
          Title: days[6],
          FuncDayFoodListPageNavi: () {
            mealBottomSheet(context, days[6], controller.goSundayBreakfast,
                controller.goSundayDinner);
          }),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.foodListTitle,
          style: GoogleFonts.inconsolata(
              fontSize: 18.sp, fontWeight: FontWeight.w600),
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

  Future<dynamic> mealBottomSheet(BuildContext context, String title,
      Function() BreakfastFunc, Function() DinnerFunc) {
    DateTime date = new DateTime.now();
    String nowdate = DateFormat('EEEE').format(date).toString().tr;
    RxInt formattedclock = int.parse(DateFormat('kk').format(date)).obs;

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
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inconsolata(
                            color: AppColors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 12.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      nowdate == title && formattedclock.value < 22
                          ? Obx(
                              () {
                                return Switch(
                                  value: controller.on.value,
                                  onChanged: (Value) {
                                    if (controller.on.value == false) {
                                      controller.getnumber();
                                      controller.number.value =
                                          controller.number.value + 1;
                                      controller.toggle();
                                      controller.notJoinUser(
                                          controller.number.value.toString());

                                      return print(controller.number.value);
                                    } else {
                                      controller.getnumber();
                                      controller.number.value =
                                          controller.number.value - 1;
                                      controller.toggle();
                                      controller.notJoinUser(
                                          controller.number.value.toString());

                                      print(controller.number.value);
                                    }
                                  },
                                  activeColor: Colors.green,
                                );
                              },
                            )
                          : Switch(value: false, onChanged: (Value) {})
                    ],
                  ),
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
  int? index;
  Function() FuncDayFoodListPageNavi;
  DayFoodListButton({
    Key? key,
    this.index,
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
              style: GoogleFonts.inconsolata(
                  color: AppColors.white, fontSize: 20.sp),
            ),
          ),
          decoration: BoxDecoration(
              color: AppColors.lakeView,
              borderRadius: BorderRadius.circular(16.sp)),
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