import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

class AnnouncementDetailController extends GetxController {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref("images/announcements").listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print("found file: $ref");
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref("images/announcements/$imageName").getDownloadURL();
    return downloadURL;
  }
}
