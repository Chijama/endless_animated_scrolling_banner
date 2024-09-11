// import 'package:endless_animated_scrolling_banner/banner/warning_banner/rhombus_painter.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import 'package:google_fonts/google_fonts.dart';

// class WarningBanner extends StatelessWidget {
//   const WarningBanner({
//     super.key,
//     required this.scrollController,
//     required this.listOfStrings,
//     this.spacing,
//   });

//   final ScrollController scrollController;
//   final List<String> listOfStrings;
//   final double? spacing;

//   @override
//   Widget build(BuildContext context) {
//     final space =
//         MediaQuery.of(context).size.width * 0.36 / listOfStrings.length;

//     SizedBox horizontalSpace() {
//       return SizedBox(width: spacing ?? space);
//     }

//     return Transform.rotate(
//       angle: -4 * (math.pi / 360),
//       alignment: FractionalOffset.center,
//       child: Container(
//         alignment: Alignment.center,
//         color: Color.fromARGB(255, 250, 156, 14),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 150,
//               child: ListView.separated(
//                   controller: scrollController,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return CustomPaint(
//                       size: Size(150,
//                           30), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                       painter: RPSCustomPainter(),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       width: 4,
//                     );
//                   },
//                   itemCount: 1000),
//             ),
//             Container(
//         padding: const EdgeInsets.all(16.0),

//               height: 120,
//               child: ListView.separated(
//                 controller: scrollController,
//                 scrollDirection: Axis.horizontal,
//                 separatorBuilder: (context, index) {
//                   return Row(
//                     children: [
//                       horizontalSpace(),
//                       const CircleAvatar(
//                         radius: 8,
//                         backgroundColor: Colors.white,
//                       ),
//                       horizontalSpace(),
//                     ],
//                   );
//                 },
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       BannerText(
//                           label: listOfStrings[index % listOfStrings.length]
//                               .toUpperCase()),
//                     ],
//                   );
//                 },
//                 itemCount: listOfStrings.length * 3,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BannerText extends StatelessWidget {
//   const BannerText({
//     super.key,
//     required this.label,
//   });
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: GoogleFonts.bebasNeue(
//         fontSize: 37,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }

// class CautionBanner extends StatelessWidget {
//   const CautionBanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:endless_animated_scrolling_banner/banner/simple_banner.dart';
import 'package:flutter/material.dart';

class WarningBanner extends StatelessWidget {
  final Offset offset;
  final List<String> listOfStrings;
  final double? spacing;

  const WarningBanner(
      {super.key,
      required this.offset,
      required this.listOfStrings,
      this.spacing});

  @override
  Widget build(BuildContext context) {
    int numOfStripes = 120;

    SizedBox horizontalSpace() {
      return SizedBox(width: spacing ?? 20);
    }

    return Transform.translate(
      offset: offset,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomPaint(
              size: const Size(35, 35),
              painter: DiagonalStripesPainter(
                numberOfStripes: numOfStripes,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: ListView.separated(
              // controller: scrollController,
              scrollDirection: Axis.horizontal, shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    label: listOfStrings[index % listOfStrings.length]
                        .toUpperCase());
              },
              itemCount: listOfStrings.length * 3100,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.flip(
                flipX: true,
                child: CustomPaint(
                  size: const Size(35, 35),
                  painter: DiagonalStripesPainter(
                    numberOfStripes: numOfStripes,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

// class DiagonalStripesPainter extends CustomPainter {
//   final int numStripes;

//   DiagonalStripesPainter({required this.numStripes});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Calculate the width and spacing based on the number of stripes
//     double totalStripeWidth = size.width / numStripes;
//     double stripeWidth = totalStripeWidth / 2;
//     double stripeSpacing = totalStripeWidth;

//     Paint paint = Paint()..color = Colors.black;

//     for (double i = -size.height; i < size.width; i += stripeSpacing) {
//       final path = Path()
//         ..moveTo(i, 0)
//         ..lineTo(i + stripeWidth, 0)
//         ..lineTo(i + size.height + stripeWidth, size.height)
//         ..lineTo(i + size.height, size.height)
//         ..close();

//       canvas.drawPath(path, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Repaint when numStripes changes
//   }
// }

class DiagonalStripesPainter extends CustomPainter {
  final int numberOfStripes;

  DiagonalStripesPainter({
    required this.numberOfStripes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    double stripeWidth = 20;
    double stripeSpacing = 15;
    double stripeHeight = 40;
    // Calculate the total width of all stripes including the spacing between them
    double totalWidth = numberOfStripes * (stripeWidth + stripeSpacing);

    // Draw the stripes
    for (double i = 0; i < totalWidth; i += (stripeWidth + stripeSpacing)) {
      final path = Path()
        ..moveTo(i, 0)
        ..lineTo(i + stripeWidth, 0)
        ..lineTo(i + size.height + stripeWidth, stripeHeight)
        ..lineTo(i + stripeHeight, stripeHeight)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
