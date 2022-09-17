import 'package:dorm_app/modules/food_list/food_list_items.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/breakfast/breakfast_controller.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RiceAndPastaScreen extends GetView<BreakfastController> {
  const RiceAndPastaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pilav ve Makarna",
          style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: AppPadding.projectPadding,
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 85.h,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return FoodListItems.riceAndPasta[index];
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: FoodListItems.riceAndPasta.length),
            )
          ],
        ),
      ),
    );
  }
}
