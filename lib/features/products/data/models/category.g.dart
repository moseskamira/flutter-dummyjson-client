// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'slug': instance.slug,
  'name': instance.name,
  'url': instance.url,
};
