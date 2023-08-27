import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/article_screen.dart';

class CustomCardWidget extends HookWidget {
  const CustomCardWidget({
    super.key,
    required this.restaurant,
    required this.isFavorited,
  });

  final Restaurant restaurant;
  final bool isFavorited;

  @override
  Widget build(BuildContext context) {
    final isGood = useState<bool>(isFavorited);
    return Center(
      child: Card(
        elevation: 4,
        child: Container(
          width: 370,
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 25),
              Image.network(restaurant.logoImage),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleScreen(url: restaurant.url),
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
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  final db = FirebaseFirestore.instance;
                  if (isGood.value == true) {
                    await db.collection('users').doc(uid).update(
                      {
                        // TODO: Cannot remove
                        'favoritedRestaurants': FieldValue.arrayUnion(
                          [restaurant.id],
                        ),
                      },
                    );
                    // await db.collection('restaurants').doc(restaurant.id).set({
                    //   'id': restaurant.id,
                    //   'name': restaurant.name,
                    //   'logoImage': restaurant.logoImage,
                    //   'urls': restaurant.url,
                    //   'favoritedUsers': [
                    //     ...restaurant.favoritedUsers,
                    //     myUserData
                    //   ],
                    // });
                  }
                  if (isGood.value == false) {
                    await db.collection('users').doc(uid).update(
                      {
                        'favoritedestaurants': FieldValue.arrayRemove(
                          [restaurant.id],
                        ),
                      },
                    );
                    // await db.collection('restaurants').doc(restaurant.id).set({
                    //   'id': restaurant.id,
                    //   'name': restaurant.name,
                    //   'logoImage': restaurant.logoImage,
                    //   'urls': restaurant.url,
                    //   'favoritedUsers': restaurant.favoritedUsers
                    //       .where((favoritedUid) => favoritedUid != uid)
                    //       .toList(),
                    // });
                  }
                },
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}
