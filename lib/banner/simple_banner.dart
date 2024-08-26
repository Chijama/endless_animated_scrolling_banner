import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class SimpleBanner extends StatelessWidget {
  const SimpleBanner({
    super.key,
    required this.scrollController,
    required this.listOfStrings,
    this.spacing,
  });

  final ScrollController scrollController;
  final List<String> listOfStrings;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final space =
        MediaQuery.of(context).size.width * 0.36 / listOfStrings.length;

    SizedBox horizontalSpace() {
      return SizedBox(width: spacing ?? space);
    }

    return Transform.rotate(
      angle: -4 * (math.pi / 360),
      alignment: FractionalOffset.center,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: const EdgeInsets.all(16.0),
        color: Colors.black,
        child: ListView.separated(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return Row(
              children: [
                horizontalSpace(),
                const CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                horizontalSpace(),
              ],
            );
          },
          itemBuilder: (context, index) {
            return BannerText(
                label:
                    listOfStrings[index % listOfStrings.length].toUpperCase());
          },
          itemCount: listOfStrings.length * 3,
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
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CautionBanner extends StatelessWidget {
  const CautionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
