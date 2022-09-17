import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class DessertsController extends GetxController {
  CollectionReference desserts = FirebaseFirestore.instance.collection("desserts");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("desserts");
}
