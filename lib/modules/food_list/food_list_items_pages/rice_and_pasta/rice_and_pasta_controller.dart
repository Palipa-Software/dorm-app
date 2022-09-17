import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class RiceAndPastaController extends GetxController {
  CollectionReference drinks = FirebaseFirestore.instance.collection("riceAndPasta");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("riceAndPasta");
}
