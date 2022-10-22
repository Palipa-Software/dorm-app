import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_app/shared/constants/strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/padding.dart';

import 'forms_controller.dart';

class FormsScreen extends GetView<FormsController> {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.formsTitle,
            style: GoogleFonts.inconsolata(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          //Fetching data from the documentId specified of the student
          stream: controller.stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //Error Handling conditions
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            //Data is output to the user
            if (snapshot.hasData) {
              return Padding(
                padding: AppPadding.projectPadding,
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 85.h,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Bounceable(
                              onTap: () async {
                                final Uri _url = Uri.parse(snapshot.data?.docs[index]["formUrl"]);

                                if (!await launchUrl(_url)) {
                                  throw 'Could not launch $_url';
                                }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(16.sp),
                                elevation: 16,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.lakeView, borderRadius: BorderRadius.circular(16.sp)),
                                  width: 100.w,
                                  height: 12.h,
                                  child: Center(
                                    child: Text(snapshot.data?.docs[index]["formTitle"],
                                        style: GoogleFonts.inconsolata(
                                            color: AppColors.white, fontSize: 20.sp, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
                            );
                            /*
                                foodName: snapshot.data?.docs[index]["foodName"],
                                foodWeight: snapshot.data?.docs[index]["foodWeight"]);
                                */
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 3.h,
                              ),
                          itemCount: snapshot.data?.docs.length ?? 0),
                    )
                  ],
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
