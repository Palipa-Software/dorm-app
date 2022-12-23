import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';
import '../../../../shared/utils/shared_preferences.dart';

class SundayDinnerController extends GetxController {
  var buttonEnabled = true;

  RxBool isNotCome = false.obs;

  CollectionReference breakfasts =
      FirebaseFirestore.instance.collection("sundayDinner");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("sundayDinner");
  @override
  void onInit() {
    super.onInit();
    SharedPrefs.getBool(
            "${FirebaseAuth.instance.currentUser!.email.toString()}sunday")
        .then((value) {
      isNotCome.value = value == null ? false : value;
    });
    var now = DateTime.now();
    var start = DateTime(now.year, now.month, now.day, 16);
    var end = DateTime(now.year, now.month, now.day + 1, 0);
    if (now.isAfter(start) && now.isBefore(end)) {
      buttonEnabled = false;
    }
  }
}
