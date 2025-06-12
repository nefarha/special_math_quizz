import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:special_math_quizz/app/data/enums/e_quiz_type.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@Freezed(unionKey: 'action', fromJson: true)
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel.drag({
    required String question,
    required EQuizType action,
    required String object,
    required int available,
    required int answer,
  }) = _Drag;

  const factory QuestionModel.tap({
    required String question,
    required EQuizType action,
    required List<int> options,
    required int answer,
    required int compareTo,
  }) = _Tap;

  const factory QuestionModel.tapMultiple({
    required String question,
    required EQuizType action,
    required List<int> options,
    required List<int> answer,
    required int compareTo,
  }) = _TapMultiple;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
