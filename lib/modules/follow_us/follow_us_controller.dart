import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUsController extends GetxController {
  final Uri _url = Uri.parse("https://twitter.com/BurdurKYGM?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor");
  Future<void> goTwitter() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
