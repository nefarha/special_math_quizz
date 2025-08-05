import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';
import 'package:special_math_quizz/app/data/utils/colour_palette.dart';
import 'package:special_math_quizz/app/data/utils/common_utils.dart';
import 'package:special_math_quizz/app/routes/app_pages.dart';

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
              () => controller.optionOrQuizz.value.match(
                () => Center(
                  child: CircularProgressIndicator(),
                ),
                (t) => t.match(
                  (l) => Center(
                    child: Text(
                      l,
                      style: CommonUtils.titleStyle,
                    ),
                  ),
                  (r) => Column(
                    spacing: 10,
                    children: [
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "Soal - Soal",
                          style: CommonUtils.headerStyle
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              var model = controller.questions[index];

                              return GestureDetector(
                                onTap: () async {
                                  await Get.toNamed(Routes.SOAL_DETAIL,
                                          arguments: model)
                                      ?.then(
                                    (value) async {
                                      await controller.getAnsweredQuizz();
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: DecorationImage(
                                      image: const AssetImage(
                                        AssetUrls.buttonBackground,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: r.contains(model.level)
                                        ? CircleAvatar(
                                            backgroundColor:
                                                ColourPalette.creamColour,
                                            child: Icon(
                                              Icons.check,
                                              color: ColourPalette.tealColour,
                                            ),
                                          )
                                        : Text(
                                            model.level.toString(),
                                            style: CommonUtils.titleStyle
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.questions.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
