import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glint/app/core/theme/color_theme.dart';
import 'package:glint/app/core/theme/text_theme.dart';
import 'package:glint/app/core/util/constant.dart';
import 'package:glint/app/data/module/user/controller.dart';
import 'package:glint/app/pages/user/controller.dart';
import 'package:glint/app/pages/user/view/setting.dart';
import 'package:glint/app/widgets/button.dart';

class UserProfilePage extends GetView<UserPageController> {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Column(
            children: [
              header(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorTheme.BUTTON1,
                  image: DecorationImage(
                    image:
                        NetworkImage(controller.userInfo?.profile ?? LOADING),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 36,
                width: 36,
              ),
              const SizedBox(width: 10),
              Text(
                controller.userInfo?.name ?? "",
                style: AppTextTheme.Title,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  MyProfilePage({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorTheme.BUTTON1,
                  image: DecorationImage(
                    image: NetworkImage(
                        userController.userInfo?.profile ?? LOADING),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 36,
                width: 36,
              ),
              const SizedBox(width: 10),
              Text(
                userController.userInfo?.name ?? "",
                style: AppTextTheme.Title,
              ),
            ],
          ),
          GTIconButton("assets/images/rabbi.svg", onTap: () {
            Get.to(() => const SettingPage());
          }),
        ],
      ),
    );
  }
}

class MetaDataItem extends StatelessWidget {
  const MetaDataItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorTheme.Gray3,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text("목표 달성 수", style: AppTextTheme.Main),
                Text("321", style: AppTextTheme.T4),
              ],
            ),
            Column(
              children: const [
                Text("팔로우", style: AppTextTheme.Main),
                Text("1,200", style: AppTextTheme.T4),
              ],
            ),
            Column(
              children: const [
                Text("목표 달성 수", style: AppTextTheme.Main),
                Text("1,250", style: AppTextTheme.T4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String asset;
  final String title;

  const UserItem({Key? key, required this.asset, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorTheme.Gray5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 10),
          Text(title, style: AppTextTheme.T4),
        ]),
      ),
    );
  }
}
