import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/constants/firebase_manager.dart';

class TomorrowDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("tomorrowDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("tomorrowDinner");
}
