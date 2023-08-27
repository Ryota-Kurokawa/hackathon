// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      name: json['name'] as String,
      old: json['old'] as String,
      comment: json['comment'] as String,
      gender: json['gender'] as String,
      matchingGender: json['matchingGender'] as String,
      favoriteRestaurantsList:
          (json['favoriteRestaurantsList'] as List<dynamic>)
              .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'old': instance.old,
      'comment': instance.comment,
      'gender': instance.gender,
      'matchingGender': instance.matchingGender,
      'favoriteRestaurantsList': instance.favoriteRestaurantsList,
    };
