import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants/firebase_manager.dart';

class TomorrowBreakfastController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("tomorrowBreakfast");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("tomorrowBreakfast");
}
