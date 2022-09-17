import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants/firebase_manager.dart';

class BreakfastController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("breakfasts");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("breakfasts");
}
