import 'package:dorm_app/modules/announcement_detail/announcement_detail_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args[0],
          style: GoogleFonts.inconsolata(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.downloadURL(args[2]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(top: 4.h, left: 5.w),
              child: Column(
                children: [
                  Container(
                    width: 90.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.fill),
                        color: AppColors.oceanNight,
                        borderRadius: BorderRadius.circular(20)),
                    child:
                        snapshot.connectionState == ConnectionState.waiting ||
                                !snapshot.hasData
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.lakeView,
                              ))
                            : null,
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
                          args[1],
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
            );
          }

          return Padding(
            padding: EdgeInsets.only(top: 12.h, left: 48.w),
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          );
        },
      ),
    );
  }
}
