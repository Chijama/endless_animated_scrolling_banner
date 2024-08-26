import 'package:endless_animated_scrolling_banner/banner/simple_banner.dart';
import 'package:endless_animated_scrolling_banner/banner/warning_banner/warning_banner.dart';
import 'package:endless_animated_scrolling_banner/endless_animated_scrolling_banner.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          EndlessScrollingAnimatedBanner(
            scrollSpeed: 3.5,
            bannerBuilder: (scrollController) => SimpleBanner(
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
          WarningBanner()
          // EndlessScrollingAnimatedBanner(
          //   scrollSpeed: 3.5,
          //   bannerBuilder: (scrollController) => WarningBanner(
          //     scrollController: scrollController,
          //     listOfStrings: const [
          //       "plan ",
          //       "design ",
          //       "implement ",
          //       "test",
          //       "deploy ",
          //       "maintain"
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
