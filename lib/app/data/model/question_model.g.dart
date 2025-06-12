// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Drag _$DragFromJson(Map<String, dynamic> json) => _Drag(
      question: json['question'] as String,
      action: $enumDecode(_$EQuizTypeEnumMap, json['action']),
      object: json['object'] as String,
      available: (json['available'] as num).toInt(),
      answer: (json['answer'] as num).toInt(),
    );

Map<String, dynamic> _$DragToJson(_Drag instance) => <String, dynamic>{
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'object': instance.object,
      'available': instance.available,
      'answer': instance.answer,
    };

const _$EQuizTypeEnumMap = {
  EQuizType.tap: 'tap',
  EQuizType.tapMultiple: 'tapMultiple',
  EQuizType.drag: 'drag',
};

_Tap _$TapFromJson(Map<String, dynamic> json) => _Tap(
      question: json['question'] as String,
      action: $enumDecode(_$EQuizTypeEnumMap, json['action']),
      options: (json['options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      answer: (json['answer'] as num).toInt(),
      compareTo: (json['compare_to'] as num).toInt(),
    );

Map<String, dynamic> _$TapToJson(_Tap instance) => <String, dynamic>{
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'options': instance.options,
      'answer': instance.answer,
      'compare_to': instance.compareTo,
    };

_TapMultiple _$TapMultipleFromJson(Map<String, dynamic> json) => _TapMultiple(
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

Map<String, dynamic> _$TapMultipleToJson(_TapMultiple instance) =>
    <String, dynamic>{
      'question': instance.question,
      'action': _$EQuizTypeEnumMap[instance.action]!,
      'options': instance.options,
      'answer': instance.answer,
      'compare_to': instance.compareTo,
    };
