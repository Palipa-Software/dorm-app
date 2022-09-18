import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/modules/activity_detail/activity_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/colors.dart';
import 'activity_controller.dart';

class ActivityScreen extends GetView<ActivityController> {
  ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String timeString = '2019-04-16 12:18:06.018950';
    DateTime date = DateTime.parse(timeString);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Etkinlikler",
            style: GoogleFonts.inconsolata(
                fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //Fetching data from the documentId specified of the student
          stream: controller.stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //Error Handling conditions
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            //Data is output to the user
            if (snapshot.hasData) {
              // Map<String, dynamic> data =
              //     snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: EdgeInsets.all(15.sp),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return Bounceable(
                        onTap: () {
                          Get.to(ActivityDetailScreen(), arguments: [
                            snapshot.data?.docs[index]["title"],
                            snapshot.data?.docs[index]["text"]
                          ]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: AppColors.lakeView,
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(13.sp),
                                  child: RichText(
                                    overflow: TextOverflow
                                        .ellipsis, // this will help add dots after maxLines
                                    maxLines:
                                        1, // max lines after that dots comes

                                    text: TextSpan(
                                        style: GoogleFonts.inconsolata(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        text: snapshot.data?.docs[index]
                                            ["title"]),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      overflow: TextOverflow
                                          .ellipsis, // this will help add dots after maxLines
                                      maxLines:
                                          3, // max lines after that dots comes

                                      text: TextSpan(
                                          style: GoogleFonts.inconsolata(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                          text: snapshot.data?.docs[index]
                                              ["text"]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 5.w, top: 0.5.h),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      DateFormat('dd-MM-yyyy').format(date),
                                      style: GoogleFonts.inconsolata(
                                          color: Colors.white, fontSize: 15.sp),
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
              );
            }

            return Center(
                child: CircularProgressIndicator(
              color: AppColors.white,
            ));
          },
        ));
  }
}
