import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/constants/firebase_manager.dart';
import 'package:get/get.dart';

class SoupsController extends GetxController {
  CollectionReference drinks = FirebaseFirestore.instance.collection("soups");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("soups");
}
