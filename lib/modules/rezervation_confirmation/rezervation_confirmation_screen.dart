import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/complaints/complaints_controller.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_controller.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_screen.dart';
import 'package:dorm_app/modules/homepage/homepage_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
import 'package:dorm_app/routes/app_pages.dart';
import 'package:dorm_app/shared/widgets/custom_rezervation_page_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/strings.dart';
import '../../shared/utils/shared_preferences.dart';
import '../../shared/widgets/custom_login_page_button.dart';
import '../login/login_controller.dart';

class RezervationConfirmationScreen
    extends GetView<RezervationConfirmationController> {
  RezervationConfirmationScreen({
    super.key,
  });
  RezervationConfirmationController controller =
      Get.put(RezervationConfirmationController());
  final LoginController _controller = LoginController();
  final GymRezervationController gymRezervationController =
      GymRezervationController();
  HomePageController homePageController = HomePageController();
  ComplaintsController complaintsController = ComplaintsController();

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.rezervation_confirmation_title,
            style: GoogleFonts.inconsolata(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("rezervation")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          FirebaseFirestore.instance.collection("rezervation").get();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.exists) {
              return SingleChildScrollView(
                child: Container(
                  width: 100.w,
                  height: 80.h,
                  margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "NOT:ALDIĞINIZ REZERVASYONLAR ERTESİ GÜN İÇİNDİR!!!",
                          style: GoogleFonts.inconsolata(
                            color: AppColors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Container(
                          height: 13.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Center(
                            child: Text(
                              "Rezervasyon saati ${arguments[0].toString()} ",
                              style: GoogleFonts.inconsolata(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        controller: controller.nameSurnameController,
                        icon: Icons.people_alt_outlined,
                        hintText: AppStrings.nameSurname,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        controller: controller.phoneNumberController,
                        icon: Icons.phone,
                        hintText: AppStrings.phoneNumber,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        readOnly: true,
                        controller: complaintsController
                            .initial(FirebaseAuth.instance.currentUser!.email),
                        icon: Icons.email_outlined,
                        hintText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Text(
                          "Rezervasyonunuz Bulunmaktadır",
                          style: GoogleFonts.inconsolata(
                            color: AppColors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  width: 100.w,
                  height: 80.h,
                  margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "NOT:ALDIĞINIZ REZERVASYONLAR ERTESİ GÜN İÇİNDİR!!!",
                          style: GoogleFonts.inconsolata(
                            color: AppColors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Container(
                          height: 13.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Center(
                            child: Text(
                              "Rezervasyon saati ${arguments[0].toString()} ",
                              style: GoogleFonts.inconsolata(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        controller: controller.nameSurnameController,
                        icon: Icons.people_alt_outlined,
                        hintText: AppStrings.nameSurname,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        controller: controller.phoneNumberController,
                        icon: Icons.phone,
                        hintText: AppStrings.phoneNumber,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomRezervationPageInput(
                        readOnly: true,
                        controller: complaintsController
                            .initial(FirebaseAuth.instance.currentUser!.email),
                        icon: Icons.email_outlined,
                        hintText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomLoginPageButton(
                        func: () async {
                          QuerySnapshot querySnapshot = await FirebaseFirestore
                              .instance
                              .collection('rezervation')
                              .where('clock',
                                  isEqualTo: arguments[0].toString())
                              .get();
                          final count = querySnapshot.size;
                          print(count);
                          count < 20
                              ? controller.createRezervation(
                                  clock: arguments[0].toString())
                              : Get.snackbar(
                                  "Rezervasyon durumu",
                                  "Rezervasyon Dolu",
                                  backgroundColor: AppColors.sodaliteBlue,
                                  titleText: Text(
                                    "Rezervasyon Durumu",
                                    style: GoogleFonts.inconsolata(
                                      color: AppColors.white,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  messageText: Text(
                                    "Rezervasyon Dolu",
                                    style: GoogleFonts.inconsolata(
                                        color: AppColors.white,
                                        fontSize: 17.sp),
                                  ),
                                );
                          controller.nameSurnameController.text = "";
                          controller.phoneNumberController.text = "";
                        },
                        isTextButton: false,
                        title: AppStrings.rezervation_confirm_button,
                        color: AppColors.lakeView,
                      )
                    ],
                  ),
                ),
              );
            }
          }
          return Text("Veri Yok");
        },
      ),
    );
  }
}
