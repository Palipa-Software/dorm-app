import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFirebaseManager {
  static Stream<QuerySnapshot<Object?>>? stream(String collectionName) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .orderBy("date", descending: true)
        .snapshots();
  }
}
