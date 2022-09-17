import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class DrinksController extends GetxController {
  CollectionReference drinks = FirebaseFirestore.instance.collection("drinks");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("drinks");
}
