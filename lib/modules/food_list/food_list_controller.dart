import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../routes/app_pages.dart';

class FoodListController extends GetxController {
  RxBool on = false.obs;
  RxInt number = 0.obs;

  @override
  void onInit() async {
    var collection = FirebaseFirestore.instance.collection('thoseNotAttend');
    var docSnapshot = await collection.doc('l3xwTVuTnHRMjnIls1Wx').get();
    var data = docSnapshot["number"];
    number.value = int.parse(data);
    print("sayı:" + data);
    super.onInit();
  }

  void toggle() => on.value = on.value ? false : true;
  Future notJoinUser(String number) async {
    final DateTime date = new DateTime.now();
    final RxInt formattedclock = int.parse(DateFormat('kk').format(date)).obs;
    var db = FirebaseFirestore.instance;
    db.collection('thoseNotAttend').doc("l3xwTVuTnHRMjnIls1Wx").set({
      'number': number,
    }, SetOptions(merge: true));
  }

  Future getnumber() async {
    var collection = FirebaseFirestore.instance.collection('thoseNotAttend');
    var docSnapshot = await collection.doc('l3xwTVuTnHRMjnIls1Wx').get();
    var data = docSnapshot["number"];
    number.value = int.parse(data);
  }

  void goMondayBreakfast() {
    Get.toNamed(Routes.MONDAYBREAKFAST);
  }

  void goMondayDinner() {
    Get.toNamed(Routes.MONDAYDINNER);
  }

  void goTuesdayBreakfast() {
    Get.toNamed(Routes.TUESDAYBREAKFAST);
  }

  void goTuesdayDinner() {
    Get.toNamed(Routes.TUESDAYDINNER);
  }

  void goWednesdayBreakfast() {
    Get.toNamed(Routes.WEDNESDAYBREAKFAST);
  }

  void goWednesdayDinner() {
    Get.toNamed(Routes.WEDNESDAYDINNER);
  }

  void goThursdayBreakfast() {
    Get.toNamed(Routes.THURSDAYBREAKFAST);
  }

  void goThursdayDinner() {
    Get.toNamed(Routes.THURSDAYDINNER);
  }

  void goFridayBreakfast() {
    Get.toNamed(Routes.FRIDAYBREAKFAST);
  }

  void goFridayDinner() {
    Get.toNamed(Routes.FRIDAYDINNER);
  }

  void goSaturdayBreakfast() {
    Get.toNamed(Routes.SATURDAYBREAKFAST);
  }

  void goSaturdayDinner() {
    Get.toNamed(Routes.SATURDAYDINNER);
  }

  void goSundayBreakfast() {
    Get.toNamed(Routes.SUNDAYBREAKFAST);
  }

  void goSundayDinner() {
    Get.toNamed(Routes.SUNDAYDINNER);
  }
}
