// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:dorm_app/modules/food_list/food_list_controller.dart';
import 'package:dorm_app/modules/food_list/food_list_items.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';

class FoodListScreen extends GetView<FoodListController> {
  final FoodListController controller = FoodListController();
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
    );
  }
}

final FoodListController controller = FoodListController();
List foodButton = [
  CustomFoodListButton(
    func: controller.foodDataReadOneTime,
    title: "Kahvaltılıklar",
  ),
  CustomFoodListButton(
    func: controller.goMainCourse,
    title: "Ana Yemekler",
  ),
  CustomFoodListButton(
    func: controller.goSoups,
    title: "Çorbalar",
  ),
  CustomFoodListButton(
    func: controller.goRiceAndPasta,
    title: "Pilav Makarnalar",
  ),
  CustomFoodListButton(
    func: controller.goDeserts,
    title: "Tatlılar",
  ),
  CustomFoodListButton(
    func: controller.goSaladAndPickle,
    title: "Salata ve Turşular",
  ),
  CustomFoodListButton(
    func: controller.goDrinks,
    title: "İçecekler",
  ),
];

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
      elevation: 10,
      borderRadius: BorderRadius.circular(16.sp),
      child: Bounceable(
        onTap: func,
        child: Container(
          alignment: Alignment.center,
          width: 100.w,
          height: 10.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp), color: AppColors.lakeView),
          child: Text(
            title,
            style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 22.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
