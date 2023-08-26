import 'package:hackathon/models/restaurant.dart';
import 'package:flutter/material.dart';

class restaurantCard extends StatelessWidget {
  restaurantCard({super.key, required Restaurant this.restaurant});

  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 20, left: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            Text(restaurant.id),
            Text(restaurant.name),
            Image.network(restaurant.logoImage),
            Text(restaurant.urls)
          ],
        ),
      ),
    );
  }
}
