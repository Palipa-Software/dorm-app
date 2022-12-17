import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CustomRezervationButton extends StatelessWidget {
  CustomRezervationButton(
      {super.key, required this.clock, this.onTap, this.color});
  final String clock;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lakeView,
            borderRadius: BorderRadius.circular(15.sp)),
        child: Center(
          child: Text(clock,
              style: GoogleFonts.inconsolata(
                  color: color == null ? AppColors.white : color,
                  fontSize: 15.sp)),
        ),
      ),
    );
  }
}
