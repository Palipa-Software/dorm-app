import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_controller.dart';
import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_today_show_screen.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/strings.dart';
import '../../shared/widgets/custom_rezervation_button.dart';
import '../rezervation_confirmation/rezervation_confirmation_screen.dart';

class GymRezervationScreen extends GetView<GymRezervationController> {
  GymRezervationScreen({super.key});
  RezervationConfirmationController _controller =
      RezervationConfirmationController();
  GymRezervationController gymRezervationController =
      Get.put(GymRezervationController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Bounceable(
              onTap: () {
                Get.to(HomePageScreen());
              },
              child: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            AppStrings.gymInTitle,
            style: GoogleFonts.inconsolata(
                fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: GridView.builder(
                    itemCount: controller.rezervationClocks.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8.sp,
                      mainAxisSpacing: 19.sp,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return CustomRezervationButton(
                        clock: controller.rezervationClocks[index].toString(),
                        onTap: () {
                          Get.to(RezervationConfirmationScreen(), arguments: [
                            controller.rezervationClocks[index].toString()
                          ]);
                        },
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bounceable(
                        onTap: () {
                          Get.to(
                            RezervationTodayShowScreen(),
                          );
                        },
                        child: Container(
                          width: 42.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: Color(0xff800000),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Bugün Spora Gideceğim Saati Göster",
                              style: GoogleFonts.inconsolata(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                    Bounceable(
                        onTap: () {
                          Get.to(
                            RezervationShowScreen(),
                          );
                        },
                        child: Container(
                          width: 42.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: Color(0xff800000),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Yarın Spora Gideceğim Saati Göster",
                              style: GoogleFonts.inconsolata(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
