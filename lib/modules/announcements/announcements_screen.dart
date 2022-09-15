import 'package:dorm_app/modules/announcement_detail/announcement_detail_screen.dart';
import 'package:dorm_app/modules/announcements/announcements_controller.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnnouncementsScreen extends GetView<AnnouncementsController> {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String timeString = '2019-04-16 12:18:06.018950';
    DateTime date = DateTime.parse(timeString);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Duyurular",
            style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Bounceable(
                  onTap: () {
                    Get.to(AnnouncementDetailScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20.h,
                      decoration: BoxDecoration(color: AppColors.lakeView, borderRadius: BorderRadius.circular(15.sp)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(13.sp),
                            child: Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis, // this will help add dots after maxLines
                                maxLines: 1, // max lines after that dots comes

                                text: TextSpan(
                                    style: GoogleFonts.inconsolata(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    text: 'Duyuru Başlığı'),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis, // this will help add dots after maxLines
                                  maxLines: 3, // max lines after that dots comes

                                  text: TextSpan(
                                      style: GoogleFonts.inconsolata(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                      text:
                                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w, top: 0.5.h),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                DateFormat('dd-MM-yyyy').format(date),
                                style: GoogleFonts.inconsolata(color: Colors.white, fontSize: 15.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
// Text(
                              
//                               overflow: TextOverflow.ellipsis,
//                               "Duyuru Başlığı Duyuru BaşlığıDuyurudfefretrtgrg BaşlığıDuyuru BaşlığıDuyuru BaşlığıDuyuru BaşlığıDuyuru BaşlığıDuyuru Başlığı",
//                               style: GoogleFonts.inconsolata(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.white),
//                             ),