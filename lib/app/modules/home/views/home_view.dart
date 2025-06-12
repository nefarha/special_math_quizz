import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';
import 'package:special_math_quizz/app/data/utils/common_utils.dart';
import 'package:special_math_quizz/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AssetUrls.background,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  'Special Math Quizz',
                  style: CommonUtils.headerStyle.copyWith(color: Colors.white),
                ),
                SizedBox(),
                _PlayButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends GetView<HomeController> {
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.toNamed(Routes.QUIZ_LIST);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: const AssetImage(AssetUrls.buttonBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          "Play",
          style: CommonUtils.titleStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
