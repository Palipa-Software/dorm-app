import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../shared/constants/firebase_manager_custom.dart';

class AnnouncementsController extends GetxController {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  CollectionReference announcement =
      FirebaseFirestore.instance.collection("announcements");

  final Stream<QuerySnapshot<Object?>>? stream =
      CustomFirebaseManager.stream("announcements");
}
