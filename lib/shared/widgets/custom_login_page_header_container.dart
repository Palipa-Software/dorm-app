import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLoginPageHeaderContainer extends StatelessWidget {
  String path;
  CustomLoginPageHeaderContainer({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 25.w,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/$path.png"),
          ),
        ),
      ),
    );
  }
}
