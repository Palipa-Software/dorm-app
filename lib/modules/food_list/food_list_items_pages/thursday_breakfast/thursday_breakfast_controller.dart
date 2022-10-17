import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class ThursdayBreakfastController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("thursdayBreakfast");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("thursdayBreakfast");
}
