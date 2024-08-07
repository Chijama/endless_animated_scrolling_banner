import 'package:endless_animated_scrolling_banner/endless_animated_scrolling_banner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endless Scrolling Animated Banner',
      home: const EndlessScrollingBanner(scrollSpeed: 3.0, listOfStrings: 
     ["plan ", "design ", "implement ","test", "deploy ","maintain"]
      ,),
    );
  }
}


