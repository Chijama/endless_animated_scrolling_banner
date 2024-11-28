import 'package:endless_animated_scrolling_banner/banner/simple_banner.dart';
import 'package:endless_animated_scrolling_banner/endless_animated_scrolling_banner.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(
            height: 30,
          ),
          // EndlessScrollingAnimatedBanner2(
          //   scrollSpeed: 10,
          //   bannerBuilder: (offSet) => WarningBanner(
          //     offset: offSet,
          //     listOfStrings: const ["DANGER", "UNDER CONSTRUCTION", "WARNING"],
          //   ),
          // ),
         
        ],
      ),
    );
  }
}
