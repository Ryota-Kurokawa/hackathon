import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hackathon/models/restaurant.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String name,
    required String old,
    required String comment,
    required String gender,
    required String matchingGender,
    required List<Restaurant> favoriteRestaurantsList,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
