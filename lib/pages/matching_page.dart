import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/pages/success_matching_page.dart';
import 'package:hackathon/widgets/matching_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

class matchingPage extends HookConsumerWidget {
  const matchingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = useState<List<UserData>>([]);
    final matchedUser = useState<List<UserData>>([]);
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

    Future<void> fetchAllUsers() async {
      final userDocs =
          await FirebaseFirestore.instance.collection('users').get();
      final users = userDocs.docs
          .map(
            (data) => UserData(
              uid: data.id,
              name: data['name'],
              old: data['old'],
              comment: data['comment'],
              gender: data['gender'],
              matchingGender: data['matchingGender'],
              favoritedRestaurants:
                  List<String>.from(data['favoritedRestaurants']),
            ),
          )
          .toList();
      print(users.toString());
      allUsers.value = users;
    }

    Future<void> getMatchedUsers() async {
      for (final restaurant in favoritedRestaurants.value) {
        for (final user in allUsers.value) {
          print(restaurant);
          print(user);

          if (user.favoritedRestaurants.contains(restaurant) &&
              !matchedUser.value.contains(user)) {
            matchedUser.value.add(user);
          }
        }
      }
    }

    Future<void> loadData() async {
      await fetchAllUsers();
      await fetchUserData();
      await getMatchedUsers();
    }

    useEffect(() {
      loadData();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'マッチング候補',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 215, 199, 47),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: matchedUser.value
                  .map((user) => MatchingCard(user: user))
                  .toList(),
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
