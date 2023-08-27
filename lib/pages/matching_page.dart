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
        matchedUsers: List<String>.from(data['matchedUsers']),
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
            ),
          )
          .toList();
      print(users.toString());
      allUsers.value = users;
    }

    Future<void> getMatchedUsers() async {
      for (final restaurant in favoritedRestaurants.value) {
        for (final user in allUsers.value) {
          if (user.favoritedRestaurants.contains(restaurant)) {
            matchedUser.value.add(user);
          }
        }
      }
    }

    useEffect(() {
      fetchAllUsers();
      fetchUserData();
      getMatchedUsers();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'マッチング候補',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_balance_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
          ),
        ],
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
