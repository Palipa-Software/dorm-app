import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Lottie.asset(
        "assets/jsons/loading.json",
        height: MediaQuery.of(context).size.height,
      )),
    );
  }
}
