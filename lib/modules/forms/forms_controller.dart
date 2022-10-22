import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/constants/firebase_manager.dart';

class FormsController extends GetxController {
  CollectionReference breakfasts = FirebaseFirestore.instance.collection("forms");

  final Stream<QuerySnapshot<Object?>>? stream = FirebaseManager.stream("forms");

  Future<void> goForms(_url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
