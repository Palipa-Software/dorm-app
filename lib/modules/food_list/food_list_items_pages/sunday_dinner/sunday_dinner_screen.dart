import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/food_list/food_list_items_pages/monday_dinner/monday_dinner_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/padding.dart';
import '../../../../shared/utils/shared_preferences.dart';
import '../../../../shared/widgets/custom_food_list_item.dart';
import 'sunday_dinner_controller.dart';

class SundayDinnerScreen extends GetView<SundayDinnerController> {
  SundayDinnerScreen({super.key});
  MondayDinnerController _controller = MondayDinnerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Pazar Akşam Yemeği",
            style: GoogleFonts.inconsolata(
                fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //Fetching data from the documentId specified of the student
          stream: controller.stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //Error Handling conditions
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            //Data is output to the user
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Padding(
                    padding: AppPadding.projectPadding,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Akşam Yemeğine Gelmeyeceğim",
                                style: GoogleFonts.inconsolata(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600)),
                            controller.buttonEnabled
                                ? Obx(() {
                                    return Switch(
                                        value: controller.isNotCome.value,
                                        onChanged: (Value) {
                                          if (controller.isNotCome.value ==
                                              false) {
                                            controller.isNotCome.value = true;
                                            SharedPrefs.setBool(
                                                "${FirebaseAuth.instance.currentUser!.email.toString()}sunday",
                                                controller.isNotCome.value);
                                            _controller.isNotComePersonCreate(
                                                "sundayDinnerIsNotCome");
                                            _controller.updateDocumentCount(
                                                "sundayDinnerIsNotCome");
                                          } else {
                                            controller.isNotCome.value = false;
                                            SharedPrefs.setBool(
                                                "${FirebaseAuth.instance.currentUser!.email.toString()}sunday",
                                                controller.isNotCome.value);

                                            _controller.isNotComePersonDelete(
                                                "sundayDinnerIsNotCome");
                                            _controller.updateDocumentCount(
                                                "sundayDinnerIsNotCome");
                                          }
                                        });
                                  })
                                : SizedBox.shrink(),
                          ],
                        ),
                        Container(
                          width: 100.w,
                          height: 80.h,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CustomFoodListItem(
                                    foodName: snapshot.data?.docs[index]
                                        ["foodName"],
                                    foodWeight: snapshot.data?.docs[index]
                                        ["foodWeight"]);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 2.h,
                                  ),
                              itemCount: snapshot.data?.docs.length ?? 0),
                        )
                      ],
                    ),
                  ),
                ],
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
