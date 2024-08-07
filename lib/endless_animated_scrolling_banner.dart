import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class EndlessScrollingBanner extends StatefulWidget {
  const EndlessScrollingBanner({
    super.key,
    required this.scrollSpeed,
    required this.listOfStrings,
  });
  final double scrollSpeed;
  final List<String> listOfStrings;
  @override
  State<EndlessScrollingBanner> createState() => _EndlessScrollingBannerState();
}

class _EndlessScrollingBannerState extends State<EndlessScrollingBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        _scrollController
            .jumpTo(_scrollController.position.pixels + widget.scrollSpeed);
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.repeat();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Banner(
          scrollController: _scrollController,
          listOfStrings: widget.listOfStrings,
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner(
      {super.key, required this.scrollController, required this.listOfStrings});

  final ScrollController scrollController;
  final List<String> listOfStrings;
  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.width * 0.12;

    SizedBox horizontalSpace() {
      return SizedBox(width: space);
    }

    return Transform.rotate(
      angle: -4 * (math.pi / 360),
      alignment: FractionalOffset.center,
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: ListView.separated(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return Row(
              children: [
                horizontalSpace(),
                const CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.black,
                ),
                horizontalSpace(),
              ],
            );
          },
          itemBuilder: (context, index) {
            return BannerText(
                label: listOfStrings[index % listOfStrings.length]);
          },
          itemCount: listOfStrings.length * 1000,
        ),
      ),
    );
  }
}

class BannerText extends StatelessWidget {
  const BannerText({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.bebasNeue(
        fontSize: 37,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
