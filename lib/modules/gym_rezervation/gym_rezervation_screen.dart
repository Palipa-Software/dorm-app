import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_controller.dart';
import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
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
                Bounceable(
                    onTap: () {
                      // Get.snackbar(
                      //   "Başarılı",
                      //   "başarılı mesaj",
                      //   backgroundColor: AppColors.sodaliteBlue,
                      //   titleText: Text(
                      //     "Rezervasyon Durumu",
                      //     style: GoogleFonts.inconsolata(
                      //       color: AppColors.white,
                      //       fontSize: 20.sp,
                      //     ),
                      //   ),
                      //   messageText: Text(
                      //     "Rezervasyonunuz Bulunmamaktadır",
                      //     style: GoogleFonts.inconsolata(
                      //       color: AppColors.white,
                      //       fontSize: 17.sp,
                      //     ),
                      //   ),
                      // );
                      Get.to(
                        RezervationShowScreen(
                            // name: data[1],
                            // clock: data[0],
                            // phone: data[2],
                            // email: data[3],
                            ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.lakeView,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          AppStrings.rezervation_show,
                          style: GoogleFonts.inconsolata(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
