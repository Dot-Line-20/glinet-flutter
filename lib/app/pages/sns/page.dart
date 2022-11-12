import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glint/app/core/theme/color_theme.dart';
import 'package:glint/app/core/theme/text_theme.dart';
import 'package:glint/app/core/util/constant.dart';
import 'package:glint/app/data/module/user/controller.dart';
import 'package:glint/app/pages/sns/controller.dart';
import 'package:glint/app/pages/sns/widget/post.dart';
import 'package:glint/app/routes/route.dart';
import 'package:glint/app/widgets/button.dart';

class SnsPage extends StatelessWidget {
  SnsPage({Key? key}) : super(key: key);

  final SnsPageController controller = Get.find<SnsPageController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: controller.refreshPost,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                child: header(),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: body()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColorTheme.BUTTON1,
              image: DecorationImage(
                image:
                    NetworkImage(userController.userInfo?.profile ?? LOADING),
                fit: BoxFit.cover,
              ),
            ),
            height: 44,
            width: 44,
          ),
        ),
        Row(
          children: [
            GTIconButton("assets/images/post.svg", onTap: () {
              Get.toNamed(Routes.post);
            }),
            GTIconButton("assets/images/search.svg", onTap: () {}),
            GTIconButton("assets/images/message.svg", onTap: () {
              Get.toNamed(Routes.chat);
            }),
          ],
        )
      ],
    );
  }

  Widget stories() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => _storyItem(),
      ),
    );
  }

  Widget _storyItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.story);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColorTheme.BUTTON1,
              ),
            ),
            const SizedBox(height: 8),
            const Text("EXAMPLE", style: AppTextTheme.Main)
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Obx(
      () => Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.posts.length,
            itemBuilder: (context, index) =>
                PostItem(post: controller.posts[index]),
          ),
          if (controller.isLoading) const CircularProgressIndicator()
        ],
      ),
    );
  }
}
