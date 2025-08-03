import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/model/question_model.dart';
import 'package:special_math_quizz/app/data/repositories/quizz_repositories.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';

class QuizListController extends GetxController {
  final quizzRepositories = QuizzRepositories();

  final questions = <QuestionModel>[].obs;
  final optionOrQuizz = Rx<Option<Either<String, Set<int>>>>(
      none()); // Option<Either<String, List<int>>>

  Future getQuestion() async {
    var result = await rootBundle.loadString(AssetUrls.dummyQuestion);
    var jsonData = jsonDecode(result);

    var resultMap = (jsonData['data'] as List<dynamic>).map(
      (e) => QuestionModel.fromJson(e),
    );

    questions.assignAll(resultMap);
  }

  Future getAnsweredQuizz() async {
    optionOrQuizz.value = none();
    var result = await quizzRepositories.getAnsweredQuizz();

    result.match(
      (l) => null,
      (r) async {
        await getQuestion();
      },
    );

    optionOrQuizz.value = optionOf(result);
  }

  @override
  void onInit() async {
    await getAnsweredQuizz();
    super.onInit();
  }
}
