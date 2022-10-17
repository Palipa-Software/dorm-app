import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class SundayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("sundayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("sundayDinner");
}
