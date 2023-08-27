<<<<<<< Updated upstream
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
=======
class Restaurant {
  // コンストラクタ
  Restaurant({
    required this.id,
    required this.name,
    required this.logoImage,
    required this.urls,
  });
>>>>>>> Stashed changes

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    @JsonKey(name: 'logo_image') @Default("") String logoImage,
    required dynamic urls,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}
