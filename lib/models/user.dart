import 'dart:ffi';

class User {
  User({
    required this.name,
    required this.old,
    required this.comment,
    required this.gender,
    required this.matchingGender,
    required this.favoriteRestaurantsList,
  });

  final String name;
  final String old;
  final String comment;
  final String gender;
  final String matchingGender;
  final List favoriteRestaurantsList;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      old: json['old'] as String,
      comment: json['comment'] as String,
      gender: json['gender'] as String,
      matchingGender: json['matchingGender'] as String,
      favoriteRestaurantsList: json['favoriteRestaurantsList'] as List,
    );
  }
}
