import 'package:dorm_app/modules/homepage/homepage_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageScreen extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fereli Sinan Efendi Erkek Öğrencii Yurdu",
          style: GoogleFonts.inconsolata(color: Colors.red, fontWeight: FontWeight.w600),
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 2.w, right: 2.w),
        controller: ScrollController(),
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Material(
            elevation: 50,
            child: Bounceable(
              onTap: () {},
              duration: Duration(milliseconds: 100),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/svgs/link.svg"),
                    Text("Bağlanntı Kur"),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFBFACE0),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
