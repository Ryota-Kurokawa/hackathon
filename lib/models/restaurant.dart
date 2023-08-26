class Restaurant {
  // コンストラクタ
  Restaurant(
      {required this.id,
      required this.name,
      required this.logoImage,
      required this.urls});

  // プロパティ
  final String id;
  final String name;
  final String logoImage;
  final String urls;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      logoImage: json['logo_image'] as String,
      urls: json['urls']['pc'] as String,
    );
  }
}
