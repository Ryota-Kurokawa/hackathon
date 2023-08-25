import 'package:flutter/material.dart';
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
                padding: EdgeInsets.only(top: 64),
              ),
              const Text(
                'SignUp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 32, left: 32),
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
                padding: EdgeInsets.only(top: 62),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
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
                    authenticator.signUp(
                        email: _emailController.text,
                        password: _passController.text);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('完了'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 123, 18),
    );
  }
}
