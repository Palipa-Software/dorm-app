import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class WednesdayBreakfastController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("wednesdayBreakfast");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("wednesdayBreakfast");
}
