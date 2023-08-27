import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String uid,
    required String name,
    required String old,
    required String comment,
    required String gender,
    required String matchingGender,
    @Default([]) List<String> favoritedRestaurants, //id
    @Default([]) List<String> matchedUsers, //id
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
