import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/pages/search_page.dart';

class firstProfilePage extends StatelessWidget {
  firstProfilePage({super.key});
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
      backgroundColor: const Color.fromARGB(255, 0xFF, 0xAB, 0x91),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 600,
          width: 300,
          //color: Color.fromARGB(255, 250, 123, 18),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: ('名前'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 229, 225),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: _oldController,
                  decoration: const InputDecoration(
                    hintText: ('年齢'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 229, 225),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: _genderController,
                  decoration: const InputDecoration(
                    hintText: ('性別(男性or女性)'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 229, 225),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _commentontCroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: ('自己紹介'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 229, 225),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: _matchingGenderController,
                  decoration: const InputDecoration(
                    helperText: ('希望があれば男性or女性'),
                    hintText: ('対象性別'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 229, 225),
                  ),
                ),
              ),
              const Padding(
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
                      builder: (context) => const searchPage(),

                    ),
                  );
                },
                child: const Text('完了'),
              )
            ],
          ),
        ),
      ),
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
      'favoriteRestaurantsList': []
    });
  }
}
