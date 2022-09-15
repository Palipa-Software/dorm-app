import 'package:dorm_app/modules/announcement_detail/announcement_detail_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnnouncementDetailScreen extends GetView<AnnouncementDetailController> {
  const AnnouncementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Duyuru Başlığı",
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
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
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
