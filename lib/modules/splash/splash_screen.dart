import 'package:flutter/material.dart';

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
