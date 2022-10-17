import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class WednesdayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("wednesdayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("wednesdayDinner");
}
