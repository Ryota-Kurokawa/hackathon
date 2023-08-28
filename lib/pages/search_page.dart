import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/matching_page.dart';
import 'package:hackathon/pages/profile_edit_page.dart';
import 'package:hackathon/pages/success_matching_page.dart';
import 'package:hackathon/widgets/restaurant_card2.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

class searchPage extends HookConsumerWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = useState<List<Restaurant>>([]);
    final favoritedRestaurants = useState<List<String>>([]);

    Future<void> fetchUserData() async {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = userDoc.data()!;
      final user = UserData(
        uid: uid,
        name: data['name'],
        old: data['old'],
        comment: data['comment'],
        gender: data['gender'],
        matchingGender: data['matchingGender'],
        favoritedRestaurants: List<String>.from(data['favoritedRestaurants']),
        matchedUsers: [],
      );
      print(user.toString());
      favoritedRestaurants.value = user.favoritedRestaurants;
    }

    Future<List<Restaurant>?> searchRestaurant(String keyword) async {
      final String KEY = dotenv.env['HOT_PEPPER_KEY'] ?? '';

      var url = Uri.https('webservice.recruit.co.jp', 'hotpepper/gourmet/v1/',
          {'key': KEY, 'keyword': keyword, 'count': '20', 'format': 'json'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final list = jsonDecode(response.body);
        final restaurants = List<Restaurant>.from(
          list['results']['shop'].map(
            (model) => Restaurant(
              id: model['id'],
              name: model['name'],
              url: model['urls']['pc'],
              logoImage: model['logo_image'],
              favoritedUsers: [],
            ),
          ),
        );
        return restaurants;
      } else {
        return [];
      }
    }

    useEffect(() {
      fetchUserData();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOT PEPPER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfileEditPage(),
              ),
            );
          },
          icon: const Icon(Icons.account_balance_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const matchingPage()),
              );
            },
            icon: const Icon(Icons.message_outlined),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 215, 199, 47),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: TextField(
              onSubmitted: (String value) async {
                final result = await searchRestaurant(value);
                restaurants.value = result!;
              },
              decoration: const InputDecoration(hintText: 'キーワード検索'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          Expanded(
            child: ListView(
              children: restaurants.value.map((restaurant) {
                return CustomCardWidget(
                  restaurant: restaurant,
                  isFavorited: favoritedRestaurants.value
                      .where((favoritedId) => favoritedId == restaurant.id)
                      .isNotEmpty,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const successMatchingPage(),
            ),
          );
        },
        child: const Text('matching成功'),
      ),
    );
  }
}
