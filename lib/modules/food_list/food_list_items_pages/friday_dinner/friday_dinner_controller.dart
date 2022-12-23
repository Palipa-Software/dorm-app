import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';
import '../../../../shared/utils/shared_preferences.dart';

class FridayDinnerController extends GetxController {
  RxBool isNotCome = false.obs;
  var buttonEnabled = true;

  CollectionReference breakfasts =
      FirebaseFirestore.instance.collection("fridayDinner");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("fridayDinner");
  @override
  void onInit() {
    super.onInit();
    SharedPrefs.getBool(
            "${FirebaseAuth.instance.currentUser!.email.toString()}friday")
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
