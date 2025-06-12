// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  switch (json['action']) {
    case 'drag':
      return _Drag.fromJson(json);
    case 'tap':
      return _Tap.fromJson(json);
    case 'tapMultiple':
      return _TapMultiple.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'action', 'QuestionModel',
          'Invalid union type "${json['action']}"!');
  }
}

/// @nodoc
mixin _$QuestionModel {
  String get question;
  EQuizType get action;
  Object get answer;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      _$QuestionModelCopyWithImpl<QuestionModel>(
          this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionModel &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, action,
      const DeepCollectionEquality().hash(answer));

  @override
  String toString() {
    return 'QuestionModel(question: $question, action: $action, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) _then) =
      _$QuestionModelCopyWithImpl;
  @useResult
  $Res call({String question, EQuizType action});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? action = null,
  }) {
    return _then(_self.copyWith(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as EQuizType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Drag implements QuestionModel {
  const _Drag(
      {required this.question,
      required this.action,
      required this.object,
      required this.available,
      required this.answer});
  factory _Drag.fromJson(Map<String, dynamic> json) => _$DragFromJson(json);

  @override
  final String question;
  @override
  final EQuizType action;
  final String object;
  final int available;
  @override
  final int answer;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DragCopyWith<_Drag> get copyWith =>
      __$DragCopyWithImpl<_Drag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DragToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Drag &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, question, action, object, available, answer);

  @override
  String toString() {
    return 'QuestionModel.drag(question: $question, action: $action, object: $object, available: $available, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$DragCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$DragCopyWith(_Drag value, $Res Function(_Drag) _then) =
      __$DragCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String question,
      EQuizType action,
      String object,
      int available,
      int answer});
}

/// @nodoc
class __$DragCopyWithImpl<$Res> implements _$DragCopyWith<$Res> {
  __$DragCopyWithImpl(this._self, this._then);

  final _Drag _self;
  final $Res Function(_Drag) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? action = null,
    Object? object = null,
    Object? available = null,
    Object? answer = null,
  }) {
    return _then(_Drag(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as EQuizType,
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Tap implements QuestionModel {
  const _Tap(
      {required this.question,
      required this.action,
      required final List<int> options,
      required this.answer,
      required this.compareTo})
      : _options = options;
  factory _Tap.fromJson(Map<String, dynamic> json) => _$TapFromJson(json);

  @override
  final String question;
  @override
  final EQuizType action;
  final List<int> _options;
  List<int> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int answer;
  final int compareTo;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TapCopyWith<_Tap> get copyWith =>
      __$TapCopyWithImpl<_Tap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TapToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tap &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.compareTo, compareTo) ||
                other.compareTo == compareTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, action,
      const DeepCollectionEquality().hash(_options), answer, compareTo);

  @override
  String toString() {
    return 'QuestionModel.tap(question: $question, action: $action, options: $options, answer: $answer, compareTo: $compareTo)';
  }
}

/// @nodoc
abstract mixin class _$TapCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$TapCopyWith(_Tap value, $Res Function(_Tap) _then) =
      __$TapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String question,
      EQuizType action,
      List<int> options,
      int answer,
      int compareTo});
}

/// @nodoc
class __$TapCopyWithImpl<$Res> implements _$TapCopyWith<$Res> {
  __$TapCopyWithImpl(this._self, this._then);

  final _Tap _self;
  final $Res Function(_Tap) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? action = null,
    Object? options = null,
    Object? answer = null,
    Object? compareTo = null,
  }) {
    return _then(_Tap(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as EQuizType,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      compareTo: null == compareTo
          ? _self.compareTo
          : compareTo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TapMultiple implements QuestionModel {
  const _TapMultiple(
      {required this.question,
      required this.action,
      required final List<int> options,
      required final List<int> answer,
      required this.compareTo})
      : _options = options,
        _answer = answer;
  factory _TapMultiple.fromJson(Map<String, dynamic> json) =>
      _$TapMultipleFromJson(json);

  @override
  final String question;
  @override
  final EQuizType action;
  final List<int> _options;
  List<int> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  final List<int> _answer;
  @override
  List<int> get answer {
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answer);
  }

  final int compareTo;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TapMultipleCopyWith<_TapMultiple> get copyWith =>
      __$TapMultipleCopyWithImpl<_TapMultiple>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TapMultipleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TapMultiple &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(other._answer, _answer) &&
            (identical(other.compareTo, compareTo) ||
                other.compareTo == compareTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question,
      action,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_answer),
      compareTo);

  @override
  String toString() {
    return 'QuestionModel.tapMultiple(question: $question, action: $action, options: $options, answer: $answer, compareTo: $compareTo)';
  }
}

/// @nodoc
abstract mixin class _$TapMultipleCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$TapMultipleCopyWith(
          _TapMultiple value, $Res Function(_TapMultiple) _then) =
      __$TapMultipleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String question,
      EQuizType action,
      List<int> options,
      List<int> answer,
      int compareTo});
}

/// @nodoc
class __$TapMultipleCopyWithImpl<$Res> implements _$TapMultipleCopyWith<$Res> {
  __$TapMultipleCopyWithImpl(this._self, this._then);

  final _TapMultiple _self;
  final $Res Function(_TapMultiple) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? action = null,
    Object? options = null,
    Object? answer = null,
    Object? compareTo = null,
  }) {
    return _then(_TapMultiple(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as EQuizType,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answer: null == answer
          ? _self._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<int>,
      compareTo: null == compareTo
          ? _self.compareTo
          : compareTo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
