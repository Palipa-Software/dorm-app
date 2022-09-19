import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/today_breakfast/today_breakfast_controller.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/tomorrow_breakfast/tomorrow_breakfast_controller.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/widgets/custom_food_list_item.dart';

class TomorrowBreakfastScreen extends GetView<TomorrowBreakfastController> {
  const TomorrowBreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Yarın Kahvaltı Listesi",
            style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //Fetching data from the documentId specified of the student
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //Error Handling conditions
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            //Data is output to the user
            if (snapshot.hasData) {
              // Map<String, dynamic> data =
              //     snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: AppPadding.projectPadding,
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 85.h,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CustomFoodListItem(
                                foodName: snapshot.data?.docs[index]["foodName"],
                                foodWeight: snapshot.data?.docs[index]["foodWeight"]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 2.h,
                              ),
                          itemCount: snapshot.data?.docs.length ?? 0),
                    )
                  ],
                ),
              );
            }

            return Center(
                child: CircularProgressIndicator(
              color: AppColors.white,
            ));
          },
        ));
  }
}
/*
Padding(
          padding: AppPadding.projectPadding,
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 85.h,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FoodListItems.breakfast[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                    itemCount: FoodListItems.breakfast.length),
              )
            ],
          ),
        ),
        */