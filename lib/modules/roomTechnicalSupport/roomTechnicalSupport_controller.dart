import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoomTechnicalSupportController extends GetxController {
  initial(val) {
    return TextEditingController(text: val);
  }

  final TextEditingController nameSurname = TextEditingController();
  final TextEditingController roomInfo = TextEditingController();
  // final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController subjectOfComplaint = TextEditingController();
  final TextEditingController complaintText = TextEditingController();

  Future createRoomTechSupport({
    required String nameSurname,
    required String roomInfo,
    required String email,
    required String subjectOfComplaint,
    required String complaintText,
  }) async {
    if (nameSurname.isNotEmpty &&
        roomInfo.isNotEmpty &&
        subjectOfComplaint.isNotEmpty &&
        complaintText.isNotEmpty) {
      final docComplaint = FirebaseFirestore.instance
          .collection("roomTechnicalSupport")
          .doc(DateTime.now().toString());

      final json = {
        "nameSurname": nameSurname,
        "roomInfo": roomInfo,
        "email": email,
        "subjectOfComplaint": subjectOfComplaint,
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
