import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/user.dart';
import 'package:hackathon/pages/search_page.dart';

class profileEditPage extends HookWidget {
  profileEditPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _matchingGenderController =
      TextEditingController();
  final TextEditingController _commentontCroller = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final user = useState<UserData?>(null);

    Future fetchUserData() async {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return;
      }
      final userDoc = await db.collection('users').doc(uid).get();
      user.value = UserData.fromJson(userDoc.data()!);
      _nameController.text = user.value!.name;
      _oldController.text = user.value!.old;
      _matchingGenderController.text = user.value!.matchingGender;
      _commentontCroller.text = user.value!.comment;
      _genderController.text = user.value!.gender;
    }

    useEffect(() {
      fetchUserData();
      return;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xffFFAB91),
      body: Center(
        child: Container(
          height: 620,
          width: 300,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
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
                padding: const EdgeInsets.only(left: 50, right: 50),
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
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_nameController.text.isEmpty ||
                      _oldController.text.isEmpty ||
                      _genderController.text.isEmpty ||
                      _matchingGenderController.text.isEmpty ||
                      _commentontCroller.text.isEmpty) {
                    return;
                  }

                  setprofile(
                    _nameController.text,
                    _oldController.text,
                    _genderController.text,
                    _matchingGenderController.text,
                    _commentontCroller.text,
                  );
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
        .update({
      'name': name,
      'old': old,
      'gender': gender,
      'matchingGender': matchingGender,
      'comment': comment,
      'email': FirebaseAuth.instance.currentUser!.email.toString(),
    });
  }
}
