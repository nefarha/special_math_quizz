import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';
import 'package:special_math_quizz/app/data/utils/common_utils.dart';

import '../controllers/quiz_list_controller.dart';

class QuizListView extends GetView<QuizListController> {
  const QuizListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AssetUrls.quizzBg,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Obx(
              () => Column(
                spacing: 10,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      "Soal - Soal",
                      style:
                          CommonUtils.headerStyle.copyWith(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        var model = controller.questions[index];

                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                              image:
                                  const AssetImage(AssetUrls.buttonBackground),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.question,
                                style: CommonUtils.bodyStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                model.action.viewName,
                                style: CommonUtils.bodyStyle
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: controller.questions.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
