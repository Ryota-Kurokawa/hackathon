class Restaurant {
  // コンストラクタ
  Restaurant({
    required this.id,
    required this.name,
    required this.logoImage,
  });

  // プロパティ
  final String id;
  final String name;
  final String logoImage;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      logoImage: json['logo_image'],
    );
  }
}
