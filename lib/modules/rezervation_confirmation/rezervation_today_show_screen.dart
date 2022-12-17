import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:dorm_app/shared/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';
import '../gym_rezervation/gym_rezervation_screen.dart';

class RezervationTodayShowScreen
    extends GetView<RezervationConfirmationController> {
  RezervationTodayShowScreen({super.key});
  RezervationConfirmationController conroller =
      Get.put(RezervationConfirmationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: Icon(null),
          title: Text(
            "BUGÜNÜN SPOR SAATİ",
            style: GoogleFonts.inconsolata(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          )),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("rezervationToday")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .get(),
        builder: (context, AsyncSnapshot snapshot) {
          FirebaseFirestore.instance.collection("rezervationToday").get();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.data == null) {
            return Text("data");
          }

          if (snapshot.hasData != null) {
            try {
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 200, horizontal: 20),
                    child: Column(children: [
                      Container(
                        width: 80.w,
                        height: 20.h,
                        margin: EdgeInsets.only(bottom: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Rezervasyon saati:${snapshot.data["clock"]}",
                                style: GoogleFonts.inconsolata(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "İsim Soyisim:${snapshot.data["name"]}",
                                style: GoogleFonts.inconsolata(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Telofon no:${snapshot.data["phone"]}",
                                style: GoogleFonts.inconsolata(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Mail adresi:${snapshot.data["email"]}",
                                style: GoogleFonts.inconsolata(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Bounceable(
                          onTap: () {
                            Get.to(
                              GymRezervationScreen(),
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 3.h),
                            decoration: BoxDecoration(
                                color: AppColors.lakeView,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Rezervasyon Sayfasına Dön",
                                style: GoogleFonts.inconsolata(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                    ]),
                  ),
                ],
              );
            } catch (e) {
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 200, horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 80.w,
                          height: 20.h,
                          margin: EdgeInsets.only(bottom: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(18.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Bugün İçin Rezervasyon Bulunmamaktadır",
                                  style: GoogleFonts.inconsolata(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Bounceable(
                            onTap: () {
                              Get.to(
                                GymRezervationScreen(),
                              );
                            },
                            child: Container(
                              width: 300,
                              height: 50,
                              margin: EdgeInsets.only(bottom: 3.h),
                              decoration: BoxDecoration(
                                  color: AppColors.lakeView,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Rezervasyon Sayfasına Dön",
                                  style: GoogleFonts.inconsolata(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            }
          }
          return Text("Veri Yok");
        },
      ),
    );
  }
}
