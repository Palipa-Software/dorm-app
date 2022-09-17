// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dorm_app/modules/homepage/homepage_controller.dart';
import 'package:dorm_app/modules/homepage/homepage_items.dart';
import 'package:dorm_app/shared/constants/colors.dart';
import 'package:dorm_app/shared/constants/padding.dart';
import 'package:dorm_app/shared/constants/strings.dart';

import '../../shared/widgets/custom_home_page_menu_button.dart';

class HomePageScreen extends GetView<HomePageController> {
  final HomePageController _controller = HomePageController();
  @override
  Widget build(BuildContext context) {
    PageController pageViewController = PageController();
    return Scaffold(
      drawer: HomePageDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.appTitle,
          style: GoogleFonts.inconsolata(
              fontSize: 17.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: AppPadding.projectPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomePageSlider(pageViewController: pageViewController),
              SizedBox(
                height: 4.h,
              ),
              DotIndicator(pageViewController: pageViewController),
              GridMenu(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  final HomePageController _controller = HomePageController();

  HomePageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/img_avatar.jpg"),
                ),
                Text(
                  "Kullanıcı Adı",
                  style: GoogleFonts.inconsolata(
                      fontWeight: FontWeight.w600, fontSize: 18.sp),
                )
              ],
            ),
            decoration: BoxDecoration(color: AppColors.lakeView),
          ),
          Bounceable(
            onTap: () {
              _controller.signOut();
            },
            child: ListTile(
              title: Text(
                "Çıkış Yap",
                style: GoogleFonts.inconsolata(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              trailing: SvgPicture.asset(
                "assets/svgs/ic_logout.svg",
                width: 3.w,
                height: 3.h,
                color: AppColors.white,
              ),
            ),
          )
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
          itemCount: 3,
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
            path: "ic_inbox_in",
            title: "Duyurlar",
            func: controller.goAnnouncement),
        CustomHomePageMenuButton(
            path: "ic_basket_ok",
            title: "Yemek Listesi",
            func: controller.goFoodList),
        CustomHomePageMenuButton(
            path: "ic_warning", title: "Şikayet", func: controller.dataRead),
        CustomHomePageMenuButton(
            path: "ic_bell", title: "Oda Teknik Destek ", func: () {}),
        CustomHomePageMenuButton(
            path: "ic_calendar", title: "Etkinlikler", func: () {}),
        CustomHomePageMenuButton(path: "ic_star", title: "Puanla", func: () {}),
      ],
    );
  }
}
