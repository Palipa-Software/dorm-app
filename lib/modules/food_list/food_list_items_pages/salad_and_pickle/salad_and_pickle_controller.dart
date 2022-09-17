import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class SaladAndPickleController extends GetxController {
  CollectionReference drinks = FirebaseFirestore.instance.collection("saladAndPickle");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("saladAndPickle");
}
