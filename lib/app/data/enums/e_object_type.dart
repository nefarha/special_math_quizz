import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:special_math_quizz/app/data/utils/asset_urls.dart';

enum EObjectType {
  @JsonValue('apple')
  apple(images: AssetUrls.apple),
  @JsonValue('banana')
  banana(images: AssetUrls.banana),
  @JsonValue('orange')
  orange(images: AssetUrls.orange),
  @JsonValue('grape')
  grape(images: AssetUrls.grape);

  const EObjectType({required this.images});
  final String images;
}
