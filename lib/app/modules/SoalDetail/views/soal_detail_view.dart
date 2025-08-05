import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:fpdart/fpdart.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:special_math_quizz/app/data/enums/e_object_type.dart';
import 'package:special_math_quizz/app/data/enums/e_quiz_type.dart';
import 'package:special_math_quizz/app/data/model/question_model.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';
import 'package:special_math_quizz/app/data/utils/colour_palette.dart';
import 'package:special_math_quizz/app/data/utils/common_utils.dart';
import 'package:special_math_quizz/app/data/utils/public_mixin.dart';
import 'dart:math';

import '../controllers/soal_detail_controller.dart';

part 'quiz_drag_view.dart';
part 'quiz_tap_view.dart';
part 'quiz_comparions_view.dart';
part 'quiz_calculate_view.dart';

class SoalDetailView extends GetView<SoalDetailController> {
  const SoalDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Level ${controller.model.level}".toString(),
          style: CommonUtils.titleStyle.copyWith(
            color: ColourPalette.creamColour,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 20,
                    children: [
                      SizedBox(),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: ColourPalette.creamColour.withAlpha(180),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          controller.model.action == EQuizType.calculate
                              ? 'Berapa hasil dari : ${controller.model.question}'
                              : controller.model.question,
                          style: CommonUtils.titleStyle
                              .copyWith(color: Colors.black),
                        ),
                      ).asGlass(
                        clipBehaviour: Clip.antiAlias,
                        clipBorderRadius: BorderRadius.circular(25),
                        blurX: 8,
                        blurY: 8,
                      ),
                      Flexible(
                        child: switch (controller.model.action) {
                          EQuizType.drag => QuizDragView(
                              model: controller.model as Drag,
                            ),
                          EQuizType.tap =>
                            QuizTapView(model: controller.model as Tap),
                          EQuizType.tapMultiple => QuizMultipleView(
                              model: controller.model as TapMultiple,
                            ),
                          EQuizType.calculate => QuizCalculateView(
                              model: controller.model as Calculate),
                        },
                      )
                    ],
                  )),
            ),
            if (controller.showWrongBanner.value)
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColourPalette.creamColour,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  width: Get.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text(
                        'Maaf jawabannya salah, Ayo Coba Lagi!!!',
                        textAlign: TextAlign.center,
                        style: CommonUtils.titleStyle,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        height: 240,
                        child: Image.asset(
                          AssetUrls.cobaLagi,
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.showWrongBanner.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColourPalette.tealColour,
                          ),
                          width: double.infinity,
                          height: 35,
                          child: Center(
                            child: Text(
                              'Kembali',
                              style: CommonUtils.bodyStyle.copyWith(
                                color: ColourPalette.creamColour,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (controller.showRightBanner.value)
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColourPalette.creamColour,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  width: Get.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text(
                        'Kamu benar, Ayo selesaikan soal selanjutnya',
                        textAlign: TextAlign.center,
                        style: CommonUtils.bodyStyle,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        height: 240,
                        child: Image.asset(
                          AssetUrls.benar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.showRightBanner.value = false;
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColourPalette.tealColour,
                          ),
                          width: double.infinity,
                          height: 35,
                          child: Center(
                            child: Text(
                              'Kembali ke soal',
                              style: CommonUtils.bodyStyle.copyWith(
                                color: ColourPalette.creamColour,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
