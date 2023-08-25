import 'package:flutter/material.dart';
import 'package:hackathon/pages/profile_page.dart';
import 'package:hackathon/pages/signup_page.dart';
import 'package:hackathon/share/authenticator.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 200),
          ),
          const Center(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 52),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 36),
            child: TextField(
              controller: _passController,
              decoration: const InputDecoration(hintText: 'password'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              'make your account',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var _result = await authenticator.emailSignIn(
                  email: _emailController.text, password: _passController.text);
              if (_result == true) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              }
            },
            child: Text(
              'login',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
