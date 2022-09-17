import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/constants/firebase_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementsController extends GetxController {
  CollectionReference announcement =
      FirebaseFirestore.instance.collection("announcements");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("announcements");
}
