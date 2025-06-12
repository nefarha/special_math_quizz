import 'package:freezed_annotation/freezed_annotation.dart';

enum EQuizType {
  @JsonValue('tap')
  tap(viewName: "Tap"),
  @JsonValue('tapMultiple')
  tapMultiple(viewName: "Tap Multiple"),
  @JsonValue('drag')
  drag(viewName: "Drag");

  const EQuizType({required this.viewName});
  final String viewName;
}
