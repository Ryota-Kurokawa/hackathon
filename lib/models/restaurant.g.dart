// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      logoImage: json['logo_image'] as String? ?? "",
      url: json['url'],
      favoritedUsers: (json['favoritedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_image': instance.logoImage,
      'url': instance.url,
      'favoritedUsers': instance.favoritedUsers,
    };
