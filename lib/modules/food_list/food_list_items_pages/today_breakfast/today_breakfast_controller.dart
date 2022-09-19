import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants/firebase_manager.dart';

class TodayBreakfastController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("todayBreakfast");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("todayBreakfast");
}
