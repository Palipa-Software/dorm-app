import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/constants/firebase_manager_custom.dart';

class ActivityController extends GetxController {
  CollectionReference announcement =
      FirebaseFirestore.instance.collection("activities");

  final Stream<QuerySnapshot<Object?>>? stream =
      CustomFirebaseManager.stream("activities");
}
