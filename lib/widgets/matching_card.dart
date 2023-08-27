import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/user.dart';

class MatchingCard extends HookWidget {
  const MatchingCard({
    super.key,
    required this.matchedUser,
  });
  final UserData matchedUser;

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
              // Image.network(matchingPartner.restaurant.logoImage),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        matchedUser.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Text("テキスト1"),
                        SizedBox(width: 8),
                        Text("テキスト2"),
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
