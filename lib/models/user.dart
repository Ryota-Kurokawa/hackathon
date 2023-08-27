// import 'dart:ffi';

// import 'package:hackathon/models/restaurant.dart';

// class UserData {
//   UserData({
//     required this.name,
//     required this.old,
//     required this.comment,
//     required this.gender,
//     required this.matchingGender,
//     required this.favoriteRestaurantsList,
//   });

//   final String name;
//   final String old;
//   final String comment;
//   final String gender;
//   final String matchingGender;
//   final List<Restaurant> favoriteRestaurantsList;

//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//       name: json['name'] as String,
//       old: json['old'] as String,
//       comment: json['comment'] as String,
//       gender: json['gender'] as String,
//       matchingGender: json['matchingGender'] as String,
//       favoriteRestaurantsList: json['favoriteRestaurantsList'].map(
//         (json) => Restaurant.fromJson(json),
//       ),
//     );
//   }
// }

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
