import 'package:dorm_app/modules/homepage/homepage_screen.dart';
import 'package:dorm_app/modules/login/login_screen.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/services/auth_service.dart';
import 'package:dorm_app/shared/utils/shared_preferences.dart';
import 'package:dorm_app/shared/widgets/circularProgress.dart';
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
  void onInit() {
    super.onInit();
    SharedPrefs.loginRead();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.to(Routes.LOGIN);
    } else {
      Get.to(Routes.HOMEPAGE);
    }
  }

  void changeVisible() {
    isVisible.value = !isVisible.value;
  }

  Future goHome() async {
    Get.to(LoadingAnimation());
    await Future.delayed(Duration(milliseconds: 2500));
    Get.offAllNamed(Routes.HOMEPAGE);
  }

  Future loading() async {
    Get.to(LoadingAnimation());
    await Future.delayed(Duration(milliseconds: 1500));
    Get.back();
  }

  void goLoginHelp() {
    Get.toNamed(Routes.LOGINHELP);
  }

  void create() async {
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: "harun@gmail.com", password: "harun33");
    } catch (e) {}
  }

  Future login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SharedPrefs.loginSaver(email, password); //               TEKRAR BAKILACAK
      goHome();
    } catch (e) {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        await loading();
        Get.snackbar(
          "Giriş Hata",
          "E-mail ya da şifre boş kalamaz!!!",
          backgroundColor: AppColors.sodaliteBlue,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Giriş Hatası",
            style: GoogleFonts.inconsolata(
                color: AppColors.white, fontSize: 20.sp),
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
      } else {
        Get.snackbar(
          "Giriş Hata",
          "E-mail ya da şifre boş kalamaz!!!",
          backgroundColor: AppColors.sodaliteBlue,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Giriş Hatası",
            style: GoogleFonts.inconsolata(
                color: AppColors.white, fontSize: 20.sp),
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
  }

  void signOut() async {
    await auth.signOut();
  }
}
