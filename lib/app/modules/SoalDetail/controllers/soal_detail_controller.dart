import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/enums/e_action_tap_type.dart';
import 'package:special_math_quizz/app/data/enums/e_quiz_type.dart';
import 'package:special_math_quizz/app/data/model/question_model.dart';
import 'package:special_math_quizz/app/data/repositories/quizz_repositories.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';
import 'package:special_math_quizz/app/data/utils/public_mixin.dart';

class SoalDetailController extends GetxController with LoadingState {
  final QuestionModel model = Get.arguments as QuestionModel;
  final quizzRepositories = QuizzRepositories();
  final _audioPlayer = AudioPlayer();

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

  submitDragAnswer({required BuildContext context}) async {
    isLoading.value = true;
    if (_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.stop();
    }

    if (count.value == model.answer) {
      var submitResult =
          await quizzRepositories.saveAnswered(level: model.level);
      submitResult.match(
        (l) async {
          await _audioPlayer.play(AssetSource(AssetUrls.failSound),
              volume: 1.0);
          debugPrint('assda $l');
        },
        (r) async {
          await _audioPlayer.play(AssetSource(AssetUrls.confettiSound),
              volume: 1.0);
          Confetti.launch(context,
              options: ConfettiOptions(
                particleCount: 100,
                spread: 100,
                angle: 90,
              ));
          showRightBanner.value = true;
        },
      );
    } else {
      showWrongBanner.value = true;
    }
    isLoading.value = false;
  }

  // Tap Section
  submitTapAnswer(
      {required int value,
      required int comparedTo,
      required BuildContext context}) async {
    isLoading.value = true;

    Tap tap = model as Tap;
    var calculateLesser = value < comparedTo;
    var calculateGreater = value > comparedTo;
    if (tap.actionTapType == EActionTapType.lesser
        ? calculateLesser
        : calculateGreater) {
      var submitResult =
          await quizzRepositories.saveAnswered(level: model.level);
      submitResult.match(
        (l) async {
          await _audioPlayer.play(AssetSource(AssetUrls.failSound),
              volume: 1.0);
          debugPrint('assda $l');
        },
        (r) async {
          await _audioPlayer.play(AssetSource(AssetUrls.confettiSound),
              volume: 1.0);
          Confetti.launch(context,
              options: ConfettiOptions(
                particleCount: 100,
                spread: 100,
                angle: 90,
              ));
          showRightBanner.value = true;
        },
      );
    } else {
      showWrongBanner.value = true;
    }
    isLoading.value = false;
  }

  // Tap Multiple Section
  final selectedItem = RxList<int>();

  selectItem({required int value}) {
    if (selectedItem.contains(value)) {
      selectedItem.remove(value);
    } else {
      selectedItem.add(value);
    }
  }

  submitTapMultipleAnswer(
      {required BuildContext context, required int targetValue}) async {
    isLoading.value = true;
    var answeredModel = List<int>.from(model.answer as List);
    var sortedSelectedItem = List<int>.from(selectedItem);

    answeredModel.sort();
    sortedSelectedItem.sort();

    if (answeredModel.length == sortedSelectedItem.length) {
      if (listEquals(answeredModel, sortedSelectedItem)) {
        var submitResult =
            await quizzRepositories.saveAnswered(level: model.level);
        submitResult.match(
          (l) async {
            await _audioPlayer.play(AssetSource(AssetUrls.failSound),
                volume: 1.0);
            debugPrint('assda $l');
          },
          (r) async {
            await _audioPlayer.play(AssetSource(AssetUrls.confettiSound),
                volume: 1.0);
            Confetti.launch(context,
                options: ConfettiOptions(
                  particleCount: 100,
                  spread: 100,
                  angle: 90,
                ));
            showRightBanner.value = true;
          },
        );
      }
    } else {
      showWrongBanner.value = true;
    }

    isLoading.value = false;
  }

  // For Calculate
  final answerController = TextEditingController();

  submitCalculateAnswer({required BuildContext context}) async {
    isLoading.value = true;

    var answer = num.tryParse(answerController.text);

    if (answer == null) {
      await _audioPlayer.play(AssetSource(AssetUrls.failSound), volume: 1.0);
      showWrongBanner.value = true;
      isLoading.value = false;
      return;
    }

    if (answer == num.parse(model.answer.toString())) {
      var submitResult =
          await quizzRepositories.saveAnswered(level: model.level);
      submitResult.match(
        (l) async {
          await _audioPlayer.play(AssetSource(AssetUrls.failSound),
              volume: 1.0);
          debugPrint('assda $l');
        },
        (r) async {
          await _audioPlayer.play(AssetSource(AssetUrls.confettiSound),
              volume: 1.0);
          Confetti.launch(context,
              options: ConfettiOptions(
                particleCount: 100,
                spread: 100,
                angle: 90,
              ));
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
      case EQuizType.calculate:
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
