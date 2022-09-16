import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/login/login_screen.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/services/auth_service.dart';
import 'package:dorm_app/shared/widgets/loading_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/routes.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  late Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isVisible = true.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      debugPrint("anasayfaya gitmedi");
      Get.to(Routes.LOGIN);
    } else {
      debugPrint("anasayfaya gitti");
      Get.to(Routes.HOMEPAGE);
    }
  }

  void changeVisible() {
    isVisible.value = !isVisible.value;
  }

  void goHome() async {
    Get.to(LoadingAnimation());
    await Future.delayed(Duration(milliseconds: 2500));
    Get.toNamed(Routes.HOMEPAGE);
  }

  void goLoginHelp() {
    Get.toNamed(Routes.LOGINHELP);
  }

  void create() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: "harun@gmail.com", password: "harun33");
      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      goHome();
    } catch (e) {
      Get.snackbar(
        "Giriş Hata",
        "E-mail ya da şifre boş kalamaz!!!",
        backgroundColor: AppColors.sodaliteBlue,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Giriş Hatası",
          style:
              GoogleFonts.inconsolata(color: AppColors.white, fontSize: 20.sp),
        ),
        messageText:
            (emailController.text.isEmpty || passwordController.text.isEmpty)
                ? Text(
                    "E-mail ya da şifre boş bırakılamaz!",
                    style: GoogleFonts.inconsolata(
                        color: AppColors.white, fontSize: 17.sp),
                  )
                : Text(
                    "Girdiğiniz e-mail ya da şifre hatalı!",
                    style: GoogleFonts.inconsolata(
                        color: AppColors.white, fontSize: 17.sp),
                  ),
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
