import 'package:endless_animated_scrolling_banner/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Endless Scrolling Animated Banner',
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}
