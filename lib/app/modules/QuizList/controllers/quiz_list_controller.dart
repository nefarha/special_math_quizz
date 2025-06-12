import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:special_math_quizz/app/data/model/question_model.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';

class QuizListController extends GetxController {
  var a = '0'.obs;

  final questions = <QuestionModel>[].obs;

  Future getQuestion() async {
    var result = await rootBundle.loadString(AssetUrls.dummyQuestion);
    var jsonData = jsonDecode(result);

    var resultMap = (jsonData['data'] as List<dynamic>).map(
      (e) => QuestionModel.fromJson(e),
    );

    questions.assignAll(resultMap);
  }

  @override
  void onInit() async {
    await getQuestion();
    super.onInit();
  }
}
