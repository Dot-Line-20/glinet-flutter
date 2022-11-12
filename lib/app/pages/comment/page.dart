import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glint/app/core/theme/color_theme.dart';
import 'package:glint/app/core/theme/text_theme.dart';
import 'package:glint/app/data/module/comment/comment.dart';
import 'package:glint/app/data/module/user/user.dart';
import 'package:glint/app/data/module/user/controller.dart';
import 'package:glint/app/pages/comment/controller.dart';
import 'package:glint/app/pages/comment/widget/bottomsheet.dart';
import 'package:glint/app/widgets/button.dart';
import 'package:glint/app/widgets/textfield.dart';

class CommentPage extends GetView<CommentPageController> {
  CommentPage({Key? key}) : super(key: key);

  final UserController userController = Get.find<UserController>();

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GTIconButton("assets/images/left_arrow.svg", onTap: () {
          Get.back();
        }),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColorTheme.BUTTON1,
          ),
          height: 44,
          width: 44,
        ),
        const SizedBox(width: 16),
        const Text("sdjafhjgfsh", style: AppTextTheme.T4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              header(),
              const SizedBox(height: 16),
              controller.obx(
                (_) => Expanded(
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.commentList.length,
                      itemBuilder: (context, index) {
                        return item(controller.userList[index],
                            controller.commentList[index]);
                      },
                    ),
                  ),
                ),
                onLoading: const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColorTheme.Blue),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GTTextFormField(
                      controller: controller.commentTextController,
                      hintText: "입력하세요",
                    ),
                  ),
                  const SizedBox(width: 16),
                  GTIconButton(
                    "assets/images/rabbi.svg",
                    onTap: controller.addComment,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(User user, Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(user.profile!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: AppTextTheme.T6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(user.email,
                          style: AppTextTheme.Main.copyWith(
                              color: AppColorTheme.Gray3)),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  CommentBottomSheet().bottomSheet();
                },
                child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColorTheme.Gray4,
                    ),
                    width: 32,
                    height: 32,
                    child: const Icon(Icons.more_horiz)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            comment.content,
            style: AppTextTheme.Main,
          ),
        ],
      ),
    );
  }
}
