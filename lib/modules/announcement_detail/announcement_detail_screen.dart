import 'package:dorm_app/modules/announcement_detail/announcement_detail_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnnouncementDetailScreen extends GetView<AnnouncementDetailController> {
  AnnouncementDetailScreen({super.key});
  AnnouncementDetailController controller =
      Get.put(AnnouncementDetailController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data[0],
          style: GoogleFonts.inconsolata(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 5.w),
        child: Column(
          children: [
            Container(
              width: 90.w,
              height: 19.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("Duyuru Resmi")),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 90.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: AppColors.lakeView,
                  borderRadius: BorderRadius.circular(20)),
              child: ListView(
                children: [
                  Center(
                      child: Text(
                    data[1],
                    style: GoogleFonts.inconsolata(
                        height: 0.3.h,
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
