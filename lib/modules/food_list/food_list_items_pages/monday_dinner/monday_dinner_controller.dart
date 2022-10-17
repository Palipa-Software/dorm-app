import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class MondayDinnerController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("mondayDinner");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("mondayDinner");
}
