import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static Stream<QuerySnapshot<Object?>>? stream(String collectionName) {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }
}
