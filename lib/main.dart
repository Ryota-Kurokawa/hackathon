import 'package:flutter/material.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  runApp(Start());
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: loginPage(),
    );
  }
}
