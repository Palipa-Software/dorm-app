import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/complaints/complaints_controller.dart';
import 'package:dorm_app/modules/gym_rezervation/gym_rezervation_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_screen.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_show_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';
import '../homepage/homepage_controller.dart';

class RezervationConfirmationController extends GetxController {
  final HomePageController homePageController = HomePageController();
  ComplaintsController complaintsController = ComplaintsController();
  var id;

  initial(val) {
    id = homePageController.auth.currentUser!.email.toString();
    RezervationShowScreen();
    RezervationConfirmationScreen();
  }

  @override
  void onInit() {
    DateTime now = DateTime.now();
    DateTime targetTime = DateTime(now.year, now.month, now.day, 09, 51);
    if (now.isAfter(targetTime)) {
      targetTime = targetTime.add(Duration(days: 1));
    }
    Duration timeUntilTarget = targetTime.difference(now);
    Timer.periodic(timeUntilTarget, (timer) {
      allDeleteRezervation();
    });
    super.onInit();
  }

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController eMailController = TextEditingController();

  Future createRezervation({required String clock}) async {
    if (nameSurnameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        clock.isNotEmpty) {
      final docRezervation = FirebaseFirestore.instance
          .collection("rezervation")
          .doc(FirebaseAuth.instance.currentUser!.email);

      final json = {
        "name": nameSurnameController.text,
        "phone": phoneNumberController.text,
        "email": FirebaseAuth.instance.currentUser!.email,
        "clock": clock,
      };

      await docRezervation.set(json);

      debugPrint("else düşmedim");
      Get.snackbar(
        "Rezervasyon Durumu",
        "Rezervasyon Başarıyla Alındı",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Rezervasyon Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Rezervasyonunuz Başarıyla Alındı",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 17.sp,
          ),
        ),
      );

      Get.to(GymRezervationScreen());
    } else {
      debugPrint("else düştüm");
      Get.snackbar(
        "Rezervasyon durumu",
        "Rezervasyon Başarısız",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Rezervasyon Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Boş Bırakılan Yerler var ya da kontenjan dolu",
          style:
              GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
      );
    }
  }

  Future deleteRezervation() async {
    try {
      await FirebaseFirestore.instance
          .collection("rezervation")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .delete();
      Get.snackbar(
        "Rezervasyon Durumu",
        "Rezervasyon Başarıyla İptal Edildi",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Rezervasyon Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Rezervasyonunuz Başarıyla İptal Edildi",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 17.sp,
          ),
        ),
      );
      Get.to(GymRezervationScreen());
    } catch (e) {
      Get.snackbar(
        "Rezervasyon durumu",
        "Rezervasyon İptal Edilemedi",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Rezervasyon Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Rezervasyon İptal Edilemedi",
          style:
              GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
      );
    }
  }

  Future allDeleteRezervation() async {
    await FirebaseFirestore.instance
        .collection("rezervation")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .delete();
  }

  Future getIds() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

// Get a reference to the collection
    CollectionReference collection = firestore.collection('rezervation');

// Get all documents in the collection
    collection.get().then((snapshot) {
      List<String> documentIDs =
          snapshot.docs.map((document) => document.id).toList();

      for (var element in documentIDs) {
        if (element.toString() == FirebaseAuth.instance.currentUser!.email) {
          deleteRezervation();
        }
      }
    });
  }

  Future createTodayRezervation({required String clock}) async {
    if (nameSurnameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        clock.isNotEmpty) {
      final todayRezervation = FirebaseFirestore.instance
          .collection("rezervationToday")
          .doc(FirebaseAuth.instance.currentUser!.email);

      final json = {
        "name": nameSurnameController.text,
        "phone": phoneNumberController.text,
        "email": FirebaseAuth.instance.currentUser!.email,
        "clock": clock,
        "date": DateFormat('dd/MM/yyyy')
            .format(DateTime.now().add(Duration(days: 1)))
      };

      await todayRezervation.set(json);
    }
  }
}
