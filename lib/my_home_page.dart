import 'package:endless_animated_scrolling_banner/endless_animated_scrolling_banner.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: EndlessScrollingAnimatedBanner(
        scrollSpeed: 3.5,
        listOfStrings: [
          "plan ",
          "design ",
          "implement ",
          "test",
          "deploy ",
          "maintain"
        ],
      ),
    );
  }
}
