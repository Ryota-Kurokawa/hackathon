class User {
  User({
    required this.name,
    required this.old,
    required this.comment,
    required this.gender,
    required this.matchingGender,
  });

  final String name;
  final String old;
  final String comment;
  final String gender;
  final String matchingGender;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      old: json['old'] as String,
      comment: json['comment'] as String,
      gender: json['gender'] as String,
      matchingGender: json['matchingGender'] as String,
    );
  }
}
