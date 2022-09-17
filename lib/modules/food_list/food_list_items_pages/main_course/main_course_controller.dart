import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class MainCourseController extends GetxController {
  CollectionReference drinks = FirebaseFirestore.instance.collection("mainCourse");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("mainCourse");
}
