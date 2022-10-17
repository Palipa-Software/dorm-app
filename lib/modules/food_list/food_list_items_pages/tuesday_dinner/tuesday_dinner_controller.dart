import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class TuesdayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("tuesdayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("tuesdayDinner");
}
