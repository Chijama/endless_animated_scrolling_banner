import 'package:endless_animated_scrolling_banner/custom_banner.dart';
import 'package:endless_animated_scrolling_banner/endless_animated_scrolling_banner.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: EndlessScrollingAnimatedBanner(
        scrollSpeed: 3.5,
        bannerBuilder: (scrollController) => CustomBanner(
          scrollController: scrollController,
          listOfStrings: const [
            "plan ",
            "design ",
            "implement ",
            "test",
            "deploy ",
            "maintain"
          ],
        ),
      ),
    );
  }
}