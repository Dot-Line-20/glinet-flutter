import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glint/app/core/theme/color_theme.dart';
import 'package:glint/app/core/theme/text_theme.dart';
import 'package:glint/app/pages/home/controller.dart';
import 'package:glint/app/routes/route.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          key: controller.navigatorKey,
          initialRoute: Routes.sns,
          onGenerateRoute: controller.onGenerateRoute,
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            elevation: 8,
            backgroundColor: AppColorTheme.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.pageIndex,
            showSelectedLabels: true,
            selectedLabelStyle: AppTextTheme.boldBlue_12,
            unselectedLabelStyle: AppTextTheme.boldGray3_12,
            selectedItemColor: AppColorTheme.BUTTON1,
            onTap: controller.changePage,
            items: [
              _bottomNavItem("assets/images/main", "홈"),
              _bottomNavItem("assets/images/main", "일정"),
              _bottomNavItem("assets/images/user", "마이"),
            ],
          ),
        ));
  }

  BottomNavigationBarItem _bottomNavItem(String imageUrl, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset("$imageUrl.svg"),
        activeIcon: SvgPicture.asset("${imageUrl}_color.svg"),
        label: label);
  }
}
