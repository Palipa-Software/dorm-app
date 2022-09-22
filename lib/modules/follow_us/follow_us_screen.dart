import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/custom_home_page_menu_button.dart';
import 'follow_us_controller.dart';

class FollowUsScreen extends GetView<FollowUsController> {
  const FollowUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.followUsTitle,
          style: GoogleFonts.inconsolata(fontSize: 17.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: AppPadding.projectPadding,
        child: GridView.count(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          controller: ScrollController(),
          crossAxisCount: 2,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 4.h,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            CustomHomePageMenuButton(
                isDisabled: true,
                path: AppStrings.followUsFacebookIconPath,
                title: AppStrings.followUsFacebook,
                func: () {}),
            CustomHomePageMenuButton(
                isDisabled: true,
                path: AppStrings.followUsInstagramIconPath,
                title: AppStrings.followUsInstagram,
                func: () {}),
            CustomHomePageMenuButton(
                path: AppStrings.followUsTwitterIconPath,
                title: AppStrings.followUsTwitter,
                func: controller.goTwitter),
            CustomHomePageMenuButton(
                isDisabled: true,
                path: AppStrings.followUsYoutubeIconPath,
                title: AppStrings.followUsYoutube,
                func: () {}),
            CustomHomePageMenuButton(
                isDisabled: true, path: AppStrings.followUsMailIconPath, title: AppStrings.followUsMail, func: () {}),
          ],
        ),
      ),
    );
  }
}
