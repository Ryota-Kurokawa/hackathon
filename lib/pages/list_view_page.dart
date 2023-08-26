import 'package:flutter/material.dart';
import 'package:hackathon/widgets/restaurant_card2.dart';
import 'package:hackathon/pages/article_screen.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) =>
                      ArticleScreen(url: 'https://github.com/sgrkn')),
                ),
              );
            },
            child: CustomCardWidget()),
        CustomCardWidget(),
        CustomCardWidget(),
        CustomCardWidget(),
      ]),
    );
  }
}
