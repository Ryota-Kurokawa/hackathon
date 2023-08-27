import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    @JsonKey(name: 'logo_image') @Default("") String logoImage,
    required dynamic url,
    @Default([]) List<String> favoritedUsers,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}
