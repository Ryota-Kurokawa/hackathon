import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/article_screen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MatchingCard extends HookWidget {
  const MatchingCard({super.key, required this.restaurant});

  final Restaurant restaurant;
  // bool isFavorite = false;

  // final _iconProvider = StateProvider<bool>((ref) => false);
  // final _colorProvider = StateProvider((ref) => null);

  @override
  Widget build(BuildContext context) {
    final isGood = useState<bool>(false);
    return Center(
      child: Card(
        elevation: 4, // Optional: Add elevation for a shadow effect
        child: Container(
          width: 370, // Adjust the width as needed
          height: 220, // Adjust the height as needed
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
            children: <Widget>[
              const SizedBox(width: 25), // Add some left padding
              // Text(
              //   'Text', // Replace with your desired text
              //   style: TextStyle(
              //     fontSize: 24, // Adjust the font size as needed
              //     fontWeight:
              //         FontWeight.bold, // Adjust the font weight as needed
              //   ),
              // ),
              Image.asset(
                restaurant.logoImage, // 画像ファイルの相対パスを指定
                width: 100, // 画像の幅を調整
                height: 100, // 画像の高さを調整
              ), // Add some space between the text and other elements
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0), // 調整する必要があるかも
                      child: Text(
                        "タイトル", // ここにタイトルのテキストを追加
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      // テキストを横に並べる
                      children: [
                        Text("テキスト1"),
                        SizedBox(width: 8), // テキスト間のスペース
                        Text("テキスト2"),
                        SizedBox(width: 8), // テキスト間のスペース
                        Text("テキスト3"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class Runner extends StatelessWidget {
  const Runner({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = Restaurant(
      id: "",
      name: "",
      logoImage: "assets/images/logo.png",
      urls: "",
    );
    return Scaffold(
      body: Center(
        child: MatchingCard(restaurant: restaurant),
      ),
    );
  }
}
