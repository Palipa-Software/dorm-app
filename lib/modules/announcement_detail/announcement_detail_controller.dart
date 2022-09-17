import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/constants/firebase_manager.dart';

class AnnouncementDetailController extends GetxController {
  CollectionReference announcement =
      FirebaseFirestore.instance.collection("announcements");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("announcements");
}
