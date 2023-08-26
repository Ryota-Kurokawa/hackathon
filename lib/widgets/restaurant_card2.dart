import 'package:flutter/material.dart';
import 'package:hackathon/models/restaurant.dart';

void main() => runApp(const CustomCardApp());

class CustomCardApp extends StatelessWidget {
  const CustomCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CustomCardWidget(restaurant),
      ),
    );
  }
}

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({Key? key, required Restaurant this.restaurant})
      : super(key: key);

  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4, // Optional: Add elevation for a shadow effect
        child: Container(
          width: 370, // Adjust the width as needed
          height: 150, // Adjust the height as needed
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
            children: <Widget>[
              const SizedBox(width: 25), // Add some left padding
              Text(
                'Text', // Replace with your desired text
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
              ),
              const SizedBox(
                  width:
                      16), // Add some space between the text and other elements
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Title'),
                    Text('SubTitle'),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: toggleFavorite,
              ),
              const SizedBox(width: 25), // Add some right padding
            ],
          ),
        ),
      ),
    );
  }
}
