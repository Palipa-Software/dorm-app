import 'package:dorm_app/modules/food_list/food_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      body: Column(),
    );
  }
}
