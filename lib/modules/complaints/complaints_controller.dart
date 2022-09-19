import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/food_list/food_list_screen.dart';
import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';

class ComplaintsController extends GetxController {
  final LoginController _controller = LoginController();
  FirebaseAuth auth = FirebaseAuth.instance;

  initial(val) {
    return TextEditingController(text: val);
  }

  final TextEditingController complaintText = TextEditingController();
  final TextEditingController complaintsUnit = TextEditingController();
  // final TextEditingController email = TextEditingController();
  final TextEditingController nameSurname = TextEditingController();
  final TextEditingController subjectOfComplaint = TextEditingController();

  void goBack() {
    Get.back();
  }

  Future createHomePageComplaint(
      {required String nameSurname,
      required String subjectOfComplaint,
      required String complaintsUnit,
      required String email,
      required String complaintText}) async {
    if (subjectOfComplaint.isNotEmpty &&
        complaintsUnit.isNotEmpty &&
        complaintText.isNotEmpty) {
      final docComplaint = FirebaseFirestore.instance
          .collection("homePageComplaint")
          .doc(DateTime.now().toString());

      final json = {
        "nameSurname": nameSurname,
        "subjectOfComplaint": subjectOfComplaint,
        "complaintsUnit": complaintsUnit,
        "email": email,
        "complaintText": complaintText
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
      Get.snackbar(
        "Success",
        "Success message",
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
          style:
              GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
      );
    }

    // Reference to document

    // Create document and write data to Firebase
  }
}
