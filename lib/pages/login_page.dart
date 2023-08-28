import 'package:flutter/material.dart';
import 'package:hackathon/pages/search_page.dart';
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
            padding: EdgeInsets.only(top: 180),
          ),
          const Icon(
            Icons.account_circle,
            size: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'ログイン',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 22),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 5),
            child: TextField(
              controller: _passController,
              decoration: const InputDecoration(hintText: 'password'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
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
              style: TextStyle(fontSize: 17),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final _result = await authenticator.emailSignIn(
                  email: _emailController.text, password: _passController.text);
              if (_result == true) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const searchPage(),
                  ),
                );
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
