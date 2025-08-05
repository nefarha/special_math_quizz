import 'package:freezed_annotation/freezed_annotation.dart';

enum EQuizType {
  @JsonValue('tap')
  tap(viewName: "Tap"),
  @JsonValue('tapMultiple')
  tapMultiple(viewName: "Tap Multiple"),
  @JsonValue('drag')
  drag(viewName: "Drag"),
  @JsonValue('calculate')
  calculate(viewName: 'calculate');

  const EQuizType({required this.viewName});
  final String viewName;
}
