import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants/firebase_manager.dart';

class TodayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("todayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("todayDinner");
}
