import 'package:dorm_app/modules/food_list/food_list_items.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/breakfast/breakfast_controller.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DessertsScreen extends GetView<BreakfastController> {
  const DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tatlılar",
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
                    return FoodListItems.deserts[index];
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: FoodListItems.deserts.length),
            )
          ],
        ),
      ),
    );
  }
}
