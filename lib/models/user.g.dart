// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      uid: json['uid'] as String,
      name: json['name'] as String,
      old: json['old'] as String,
      comment: json['comment'] as String,
      gender: json['gender'] as String,
      matchingGender: json['matchingGender'] as String,
      favoritedRestaurants: (json['favoritedRestaurants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      matchedUsers: (json['matchedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'old': instance.old,
      'comment': instance.comment,
      'gender': instance.gender,
      'matchingGender': instance.matchingGender,
      'favoritedRestaurants': instance.favoritedRestaurants,
      'matchedUsers': instance.matchedUsers,
    };
