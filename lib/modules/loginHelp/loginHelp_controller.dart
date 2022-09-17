import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginHelpController extends GetxController {
  final TextEditingController nameSurname = TextEditingController();
  final TextEditingController roomInfo = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController problemText = TextEditingController();
  void goBack() {
    Get.back();
  }

  Future createComplaint(
      {required String nameSurname,
      required String roomInfo,
      required String phoneNumber,
      required String problemText}) async {
    if (nameSurname.isNotEmpty &&
        roomInfo.isNotEmpty &&
        problemText.isNotEmpty) {
      final docComplaint = FirebaseFirestore.instance
          .collection("loginComplaint")
          .doc(DateTime.now().toString());

      final json = {
        "nameSurname": nameSurname,
        "roomInfo": roomInfo,
        "phoneNumber": phoneNumber,
        "problemText": problemText,
      };
      await docComplaint.set(json);
      debugPrint("else düşmedim");
      Get.snackbar(
        "Başarılı",
        "başarılı mesaj",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Şikayet Formu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Sorununuz İletildi!",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 17.sp,
          ),
        ),
      );
    } else {
      debugPrint("else düştüm");
      Get.snackbar("Success", "Success message",
          backgroundColor: AppColors.sodaliteBlue,
          titleText: Text(
            "Şikayet Formu",
            style: GoogleFonts.inconsolata(
              color: AppColors.white,
              fontSize: 20.sp,
            ),
          ),
          messageText: Text(
            "Boş Bırakılan Yerleri Doldurunuz!!!",
            style: GoogleFonts.inconsolata(
                color: AppColors.white, fontSize: 17.sp),
          ));
    }

    // Reference to document

    // Create document and write data to Firebase
  }
}
