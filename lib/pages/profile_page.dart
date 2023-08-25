import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hackathon/pages/search_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _matchingGenderController =
      TextEditingController();
  final TextEditingController _commentontCroller = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    label: Text('名前'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: TextField(
                  controller: _oldController,
                  decoration: const InputDecoration(
                    label: Text('年齢'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: TextField(
                  controller: _genderController,
                  decoration: const InputDecoration(
                    label: Text('性別'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: TextField(
                  controller: _commentontCroller,
                  decoration: const InputDecoration(
                    label: Text('自己紹介'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: TextField(
                  controller: _matchingGenderController,
                  decoration: const InputDecoration(
                    label: Text('対象性別'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              ElevatedButton(
                onPressed: () async {
                  setprofile(
                      _nameController.text,
                      _oldController.text,
                      _genderController.text,
                      _matchingGenderController.text,
                      _commentontCroller.text);
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => searchPage(),
                    ),
                  );
                },
                child: const Text('完了'),
              )
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.orange,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => matchingPage(),
      //       ),
      //     );
      //   },
      //   child: const Text("Next"),
      // ),

    );
  }

  Future<void> setprofile(String name, String old, String gender,
      String matchingGender, String comment) async {
    await db
        .collection('users')
        .doc(
          FirebaseAuth.instance.currentUser!.uid.toString(),
        )
        .set({
      'name': name,
      'old': old,
      'gender': gender,
      'matchingGender': matchingGender,
      'comment': comment,
      'email': FirebaseAuth.instance.currentUser!.email.toString(),
    });
  }
}
