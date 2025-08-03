// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drag _$DragFromJson(Map<String, dynamic> json) => Drag(
      level: (json['level'] as num).toInt(),
      question: json['question'] as String,
      action: $enumDecode(_$EQuizTypeEnumMap, json['action']),
      object: $enumDecode(_$EObjectTypeEnumMap, json['object']),
      available: (json['available'] as num).toInt(),
      answer: (json['answer'] as num).toInt(),
    );

Map<String, dynamic> _$DragToJson(Drag instance) => <String, dynamic>{
      'level': instance.level,
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'object': _$EObjectTypeEnumMap[instance.object]!,
      'available': instance.available,
      'answer': instance.answer,
    };

const _$EQuizTypeEnumMap = {
  EQuizType.tap: 'tap',
  EQuizType.tapMultiple: 'tapMultiple',
  EQuizType.drag: 'drag',
};

const _$EObjectTypeEnumMap = {
  EObjectType.apple: 'apple',
  EObjectType.banana: 'banana',
  EObjectType.orange: 'orange',
  EObjectType.grape: 'grape',
};

Tap _$TapFromJson(Map<String, dynamic> json) => Tap(
      level: (json['level'] as num).toInt(),
      question: json['question'] as String,
      action: $enumDecode(_$EQuizTypeEnumMap, json['action']),
      options: (json['options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      answer: (json['answer'] as num).toInt(),
      compareTo: (json['compare_to'] as num).toInt(),
    );

Map<String, dynamic> _$TapToJson(Tap instance) => <String, dynamic>{
      'level': instance.level,
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'options': instance.options,
      'answer': instance.answer,
      'compare_to': instance.compareTo,
    };

TapMultiple _$TapMultipleFromJson(Map<String, dynamic> json) => TapMultiple(
      level: (json['level'] as num).toInt(),
      question: json['question'] as String,
      action: $enumDecode(_$EQuizTypeEnumMap, json['action']),
      options: (json['options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      answer: (json['answer'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      compareTo: (json['compare_to'] as num).toInt(),
    );

Map<String, dynamic> _$TapMultipleToJson(TapMultiple instance) =>
    <String, dynamic>{
      'level': instance.level,
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'options': instance.options,
      'answer': instance.answer,
      'compare_to': instance.compareTo,
    };
