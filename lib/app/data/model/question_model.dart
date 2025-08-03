import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:special_math_quizz/app/data/enums/e_object_type.dart';
import 'package:special_math_quizz/app/data/enums/e_quiz_type.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@Freezed(unionKey: 'action', fromJson: true)
sealed class QuestionModel with _$QuestionModel {
  const factory QuestionModel.drag({
    required int level,
    required String question,
    required EQuizType action,
    required EObjectType object,
    required int available,
    required int answer,
  }) = Drag;

  const factory QuestionModel.tap({
    required int level,
    required String question,
    required EQuizType action,
    required List<int> options,
    required int answer,
    required int compareTo,
  }) = Tap;

  const factory QuestionModel.tapMultiple({
    required int level,
    required String question,
    required EQuizType action,
    required List<int> options,
    required List<int> answer,
    required int compareTo,
  }) = TapMultiple;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
