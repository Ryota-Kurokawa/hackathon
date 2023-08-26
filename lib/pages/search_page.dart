import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/restaurant.dart';
import 'package:hackathon/pages/profile_edit_page.dart';
import 'package:hackathon/widgets/restaurant-card.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class searchPage extends HookConsumerWidget {
  searchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = useState<List<Restaurant>>([]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOT PEPPER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => profileEditPage()));
            },
            icon: Icon(Icons.account_balance_outlined)),
        backgroundColor: Color.fromARGB(255, 215, 199, 47),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: TextField(
              onSubmitted: (String value) async {
                // final result = await searchRestaurant(value);
                // setState(() => restaurants = results); //riverpodで状態管理を試してみる
                debugPrint("Search!");
                debugPrint(value);
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
              children: restaurants.value
                  .map(
                    (restaurant) => restaurantCard(restaurant: restaurant),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Restaurant>?> searchRestaurant(String keyword) async {
    final String KEY = dotenv.env['HOT_PEPPER_KEY'] ?? '';

    var url = Uri.https('webservice.recruit.co.jp', 'hotpepper/gourmet/v1/',
        {'key': KEY, 'keyword': keyword, 'format': 'json'});
    // var response = await http.post(
    //   url,
    //   body: {'key': KEY, 'keyword': keyword, 'format': 'json'},
    // );
    final response = await http.get(url);
    debugPrint(response.body.toString());

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
