import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackathon/models/user.dart';
import 'package:hackathon/pages/search_page.dart';

enum Gender { male, female, other }

class ProfileEditPage extends HookWidget {
  ProfileEditPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _matchingGenderController =
      TextEditingController();
  final TextEditingController _commentontCroller = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final db = FirebaseFirestore.instance;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = useState<UserData?>(null);
    final _genderValue = useState<Gender?>(null);
    final _targetGenderValue = useState<Gender?>(null);

    Future fetchUserData() async {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        return;
      }
      final userDoc = await db.collection('users').doc(uid).get();
      if (userDoc.exists) {
        user.value = UserData.fromJson(userDoc.data()!);
        _nameController.text = user.value!.name;
        _oldController.text = user.value!.old;
        _matchingGenderController.text = user.value!.matchingGender;
        _commentontCroller.text = user.value!.comment;
        _genderController.text = user.value!.gender;
      }
    }

    useEffect(() {
      fetchUserData();
      return;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xffFFAB91),
      body: Center(
        child: Container(
          height: 800,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // ここで角丸の半径を指定
          ),
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
                    labelText: '名前',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _oldController,
                  decoration: const InputDecoration(
                    labelText: '年齢',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _commentontCroller,
                  decoration: const InputDecoration(labelText: 'ひとこと'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '性別',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: _genderValue.value,
                            onChanged: (Gender? value) {
                              _genderValue.value = value;
                            },
                          ),
                          const Text('男性'),
                        ],
                      ),
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.female,
                            groupValue: _genderValue.value,
                            onChanged: (Gender? value) {
                              _genderValue.value = value;
                            },
                          ),
                          const Text('女性'),
                        ],
                      ),
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.other,
                            groupValue: _genderValue.value,
                            onChanged: (Gender? value) {
                              _genderValue.value = value;
                            },
                          ),
                          const Text('その他'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '対象性別',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: _targetGenderValue.value,
                            onChanged: (Gender? value) {
                              _targetGenderValue.value = value;
                            },
                          ),
                          const Text('男性'),
                        ],
                      ),
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.female,
                            groupValue: _targetGenderValue.value,
                            onChanged: (Gender? value) {
                              _targetGenderValue.value = value;
                            },
                          ),
                          const Text('女性'),
                        ],
                      ),
                      Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.other,
                            groupValue: _targetGenderValue.value,
                            onChanged: (Gender? value) {
                              _targetGenderValue.value = value;
                            },
                          ),
                          const Text('どちらでも'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'URL',
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
                      _commentontCroller.text.isEmpty) {
                    print('text empty');
                    return;
                  }

                  await setprofile(
                    _nameController.text,
                    _oldController.text,
                    // _genderController.text,
                    _genderValue.toString(),
                    _matchingGenderController.text,
                    _commentontCroller.text,
                  );

                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const searchPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFFAB91), // 背景色を青に変更
                  onPrimary: Colors.white, // テキスト色を白に変更
                ),
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
        .doc(FirebaseAuth.instance.currentUser!.uid)
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
