import 'package:flutter/material.dart';
import 'package:hackathon/pages/first_profile_page.dart';
import 'package:hackathon/share/authenticator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 480,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 95),
              ),
              const Text(
                'サインアップ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 37, left: 37),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      label: Text(
                        'email',
                      ),
                      fillColor: Colors.blue),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37, right: 37),
                child: TextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    label: Text('password'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passController.text.isNotEmpty) {
                    await authenticator.signUp(
                        email: _emailController.text,
                        password: _passController.text);

                    var _result = await authenticator.emailSignIn(
                        email: _emailController.text,
                        password: _passController.text);
                    if (_result == true) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => firstProfilePage(),
                        ),
                      );
                    }

                    // await Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => searchPage(),
                    //   ),
                    // );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFFAB91),
                  minimumSize: Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // 丸みを持たせる半径を指定
                  ), // ボタンの背景色を設定
                ),
                child: const Text('完了'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffFFAB91),
    );
  }
}
