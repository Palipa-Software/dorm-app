import 'dart:async';

import 'package:dorm_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Lottie.asset("assets/jsons/lottie_splash.json",
            fit: BoxFit.fill, height: MediaQuery.of(context).size.height),
      ),
    );
  }
}
/*
startTimer() async {
  var duration = Duration(seconds: 4);
  return Timer(duration, Get.toNamed(Routes.LOGIN))
}
*/