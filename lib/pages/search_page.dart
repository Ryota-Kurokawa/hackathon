import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/good_stores_page.dart';
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
    final favoritedRestaurants = useState<List<Restaurant>>([]);

    Future<void> fetchUserData() async {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      print(userDoc.toString());
      final user = UserData.fromJson(userDoc.data()!);
      print(user.toString());
      favoritedRestaurants.value = user.favoriteRestaurantsList;
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
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => profileEditPage(),
              ),
            );
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const goodStoresPage(),
                ),
              );
            },
            icon: const Icon(Icons.message_outlined),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0xFF, 0xAB, 0x91),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: TextField(
              cursorColor: Color.fromARGB(255, 251, 181, 160),
              onSubmitted: (String value) async {
                final result = await searchRestaurant(value);
                restaurants.value = result!;
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 251, 181, 160),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 251, 181, 160),
                      )),
                  prefixIcon: Icon(Icons.search,
                      color: const Color.fromARGB(255, 116, 107, 107)),
                  hintText: 'キーワード検索'),
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
                      .where((data) => data.id == restaurant.id)
                      .isNotEmpty,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 150,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => successMatchingPage(),
              ),
            );
          },
          backgroundColor: Color.fromARGB(255, 251, 181, 160),
          child: Icon(
            Icons.handshake,
            size: 50,
          ),
        ),
      ),
    );
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
          (model) => Restaurant.fromJson(model),
        ),
      );
      return restaurants;
    } else {
      return [];
    }
  }
}
