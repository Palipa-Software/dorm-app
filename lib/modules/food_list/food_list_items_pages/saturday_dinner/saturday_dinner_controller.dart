import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class SaturdayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("saturdayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("saturdayDinner");
}
