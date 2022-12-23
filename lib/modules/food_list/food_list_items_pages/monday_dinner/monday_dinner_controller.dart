import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/firebase_manager.dart';

class MondayDinnerController extends GetxController {
  RxBool isNotCome = false.obs;
  RxInt no = 0.obs;
  var buttonEnabled = true;

  @override
  void onInit() {
    super.onInit();
    SharedPrefs.getBool(
            "${FirebaseAuth.instance.currentUser!.email.toString()}monday")
        .then((value) {
      isNotCome.value = value == null ? false : value;
    });
    var now = DateTime.now();
    var start = DateTime(now.year, now.month, now.day, 16);
    var end = DateTime(now.year, now.month, now.day + 1, 0);
    if (now.isAfter(start) && now.isBefore(end)) {
      buttonEnabled = false;
    }
  }

  CollectionReference breakfasts =
      FirebaseFirestore.instance.collection("mondayDinner");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("mondayDinner");

  Future isNotComePersonCreate(String collection) async {
    final setdoc = FirebaseFirestore.instance
        .collection(collection)
        .doc("persons")
        .collection("personInfo")
        .doc(FirebaseAuth.instance.currentUser!.email.toString());
    final json = {"email": FirebaseAuth.instance.currentUser!.email.toString()};
    await setdoc.set(json);
  }

  Future isNotComePersonDelete(String collection) async {
    final deletedoc = await FirebaseFirestore.instance
        .collection(collection)
        .doc("persons")
        .collection("personInfo")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .delete();
  }

  Future<void> updateDocumentCount(String collections) async {
    // Koleksiyonun tüm dökümanlarını oku
    CollectionReference collection = FirebaseFirestore.instance
        .collection(collections)
        .doc("persons")
        .collection("personInfo");
    QuerySnapshot snapshot = await collection.get();

    // Dökümanların sayısını al
    int documentCount = snapshot.docs.length;

    // Döküman sayısını yazdırmak istediğiniz dökümanın referansını alın
    DocumentReference document =
        FirebaseFirestore.instance.collection(collections).doc("personNo");

    // Dökümanı güncelleyin ve döküman sayısını kaydedin
    await document.update({'numberOfPeople': documentCount});
  }
}
