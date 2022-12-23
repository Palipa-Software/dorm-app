// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dorm_app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dorm_app/modules/homepage/homepage_controller.dart';
import 'package:dorm_app/modules/homepage/homepage_items.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';

import '../../shared/widgets/custom_home_page_menu_button.dart';

class HomePageScreen extends GetView<HomePageController> {
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    PageController pageViewController = PageController();
    return Scaffold(
      drawer: HomePageDrawer(
        controller: controller,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.appTitle,
          style: GoogleFonts.inconsolata(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.projectPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BannerAds(controller: controller),
              SizedBox(
                height: 2.h,
              ),
              HomePageSlider(pageViewController: pageViewController),
              SizedBox(
                height: 4.h,
              ),
              DotIndicator(pageViewController: pageViewController),
              GridMenu(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerAds extends StatelessWidget {
  const BannerAds({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.staticAdLoaded.value == true
            ? Container(
                child: AdWidget(
                  ad: controller.staticAd,
                ),
                width: controller.staticAd.size.width.toDouble(),
                height: controller.staticAd.size.height.toDouble(),
              )
            : Container();
      },
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  final HomePageController controller;
  final LoginController controllerLogin = LoginController();

  HomePageDrawer({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 25.h,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppStrings.profileIconPath),
                  ),
                  Text(
                    controller.auth.currentUser!.email.toString(),
                    style: GoogleFonts.inconsolata(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  )
                ],
              ),
              decoration: BoxDecoration(color: AppColors.lakeView),
            ),
          ),
          Container(
            height: 75.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bounceable(
                  onTap: () {
                    controller.signOut();
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      AppStrings.exitText,
                      style: GoogleFonts.inconsolata(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    trailing: SvgPicture.asset(
                      AppStrings.exitIconPath,
                      width: 3.w,
                      height: 3.h,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  AppStrings.versionCode,
                  style: GoogleFonts.inconsolata(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        width: 100.w,
        height: 25.h,
        child: PageView.builder(
          padEnds: true,
          itemCount: HomePageItems.SliderImagePath.length,
          controller: pageViewController,
          itemBuilder: (context, index) {
            return Container(
              width: 95.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    HomePageItems.SliderImagePath[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageViewController,
      count: HomePageItems.SliderImagePath.length,
      effect: WormEffect(
          activeDotColor: AppColors.sodaliteBlue,
          dotHeight: 14.sp,
          dotWidth: 14.sp,
          dotColor: AppColors.sodaliteBlue.withOpacity(0.6)),
    );
  }
}

// ignore: must_be_immutable
class GridMenu extends StatelessWidget {
  HomePageController controller;
  GridMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      controller: ScrollController(),
      crossAxisCount: 2,
      crossAxisSpacing: 6.w,
      mainAxisSpacing: 4.h,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        CustomHomePageMenuButton(
            path: AppStrings.announcementIconPath,
            title: AppStrings.announcementsTitle,
            func: controller.goAnnouncement),
        CustomHomePageMenuButton(
            path: AppStrings.foodListIconPath, title: AppStrings.foodListTitle, func: controller.goFoodList),
        CustomHomePageMenuButton(
            path: AppStrings.complaintIconPath, title: AppStrings.complaintsTitle, func: controller.goComplaint),
        CustomHomePageMenuButton(
            path: AppStrings.roomTechSupportIconPath,
            title: AppStrings.roomTechSupportTitle,
            func: controller.goRoomTechSupport),
        CustomHomePageMenuButton(
            path: AppStrings.formsIconPath, title: AppStrings.formsTitle, func: controller.goForms),
        CustomHomePageMenuButton(
            path: AppStrings.activityIconPath, title: AppStrings.activityTitle, func: controller.goActivity),
        CustomHomePageMenuButton(
            path: AppStrings.followUsIconPath, title: AppStrings.followUsTitle, func: controller.goFollowUs),
        CustomHomePageMenuButton(path: AppStrings.gymIconPath, title: AppStrings.gymTitle, func: controller.goGym),
      ],
    );
  }
}
