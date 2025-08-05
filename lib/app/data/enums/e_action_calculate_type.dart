import 'package:freezed_annotation/freezed_annotation.dart';

enum EActionCalculateType {
  @JsonValue('substract')
  subtract,
  @JsonValue('add')
  add,
  @JsonValue('multiply')
  multiply,
  @JsonValue('divide')
  divide,
  @JsonValue('mix')
  mix,
}
