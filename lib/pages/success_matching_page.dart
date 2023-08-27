import 'package:flutter/material.dart';

class successMatchingPage extends StatelessWidget {
  const successMatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
          Container(
            child: const Column(
              children: [
                Row(
                  children: [
                    Text('test'),
                  ],
                ),
                Row(
                  children: [
                    Text('text'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
