import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/article_screen.dart';

// void toggleFavorite() {
//   setState(
//     () {
//       isFavorite = !isFavorite;
//     },
//   );
// }

class CustomCardWidget extends HookWidget {
  const CustomCardWidget({
    super.key,
    required this.restaurant,
    required this.isFavorited,
  });

  final Restaurant restaurant;
  final bool isFavorited;

  // final _iconProvider = StateProvider<bool>((ref) => false);
  // final _colorProvider = StateProvider((ref) => null);

  @override
  Widget build(BuildContext context) {
    final isGood = useState<bool>(isFavorited);
    return Center(
      child: Card(
        elevation: 4, // Optional: Add elevation for a shadow effect
        child: Container(
          width: 370, // Adjust the width as needed
          height: 150, // Adjust the height as needed
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
              Image.network(restaurant.logoImage),

              const SizedBox(
                  width:
                      16), // Add some space between the text and other elements
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // ここから画面に飛ぶ
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleScreen(url: restaurant.urls['pc']),
                          ),
                        );
                      },
                      child: Text(restaurant.name),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isGood.value ? Icons.favorite : Icons.favorite_border,
                  color: isGood.value ? Colors.red : null,
                ),
                onPressed: () async {
                  isGood.value = !isGood.value;

                  if (isGood.value == true) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                      {
                        'favoriteRestaurantsList': FieldValue.arrayUnion(
                          [
                            Restaurant(
                              id: restaurant.id,
                              name: restaurant.name,
                              logoImage: restaurant.logoImage,
                              urls: restaurant.urls,
                            ).toJson(),
                          ],
                        ),
                      },
                    );
                  }
                  if (isGood.value == false) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                      {
                        'favoriteRestaurantsList': FieldValue.arrayRemove(
                          [
                            Restaurant(
                                id: restaurant.id,
                                name: restaurant.name,
                                logoImage: restaurant.logoImage,
                                urls: restaurant.urls)
                          ],
                        ),
                      },
                    );
                  }
                },
              ),
              const SizedBox(width: 25), // Add some right padding
            ],
          ),
        ),
      ),
    );
  }
}
