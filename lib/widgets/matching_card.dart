import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/user.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MatchingCard extends HookWidget {
  const MatchingCard({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: Container(
          width: 370,
          height: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 25),
              // Image.asset(
              //   user.logoImage,
              //   width: 100,
              //   height: 100,
              // ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0), // 調整する必要があるかも
                      child: Text(
                        user.name, // ここにタイトルのテキストを追加
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      // テキストを横に並べる
                      children: [
                        Text("テキスト1"),
                        SizedBox(width: 8),
                        Text("テキスト2"),
                        SizedBox(width: 8),
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
