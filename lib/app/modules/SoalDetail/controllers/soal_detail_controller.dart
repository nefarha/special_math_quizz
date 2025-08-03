import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/enums/e_quiz_type.dart';
import 'package:special_math_quizz/app/data/model/question_model.dart';
import 'package:special_math_quizz/app/data/repositories/quizz_repositories.dart';
import 'package:special_math_quizz/app/data/utils/public_mixin.dart';

class SoalDetailController extends GetxController with LoadingState {
  final QuestionModel model = Get.arguments as QuestionModel;
  final quizzRepositories = QuizzRepositories();

  /// Global Condition ///
  final showWrongBanner = false.obs;
  final showRightBanner = false.obs;

  /// For drag quiz ///
  final count = 0.obs;
  final available = 0.obs;

  incrementDragValue({required bool isForBasket}) {
    if (isForBasket) {
      if (available.value > 0) {
        available.value--;
        count.value++;
      }
    } else {
      if (count.value > 0) {
        available.value++;
        count.value--;
      }
    }
  }

  submitDragAnswer() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    if (count.value == model.answer) {
      var submitResult =
          await quizzRepositories.saveAnswered(level: model.level);
      submitResult.match(
        (l) {
          debugPrint('assda $l');
        },
        (r) {
          showRightBanner.value = true;
        },
      );
    } else {
      showWrongBanner.value = true;
    }
    isLoading.value = false;
  }

  initModelValue() {
    switch (model.action) {
      case EQuizType.drag:
        available.value = (model as Drag).available;
        break;
      case EQuizType.tap:
        // available.value = (model as Tap).available;
        break;
      case EQuizType.tapMultiple:
        // available.value = (model as TapMultiple).available;
        break;
    }
  }

  @override
  void onInit() {
    initModelValue();
    super.onInit();
  }
}
