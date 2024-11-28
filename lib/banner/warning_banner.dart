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

  const WarningBanner({
    super.key,
    required this.offset,
    required this.listOfStrings,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    SizedBox horizontalSpace() {
      return SizedBox(width: spacing ?? 20);
    }

    return Container(
      color: Colors.amber,
      child: Transform.translate(
        offset: offset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            skew(.6),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Colors.black,
                    label: listOfStrings[index % listOfStrings.length]
                        .toUpperCase(),
                  );
                },
                itemCount: listOfStrings.length * 50,
              ),
            ),
            skew(-.6),
          ],
        ),
      ),
    );
  }

  SizedBox skew(double alpha) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          ...List.generate(
            1000,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 20,
              height: 30,
              transform: Matrix4.skewX(alpha),
              color: Colors.black,
            ),
          ),
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

// import 'package:flutter/material.dart';

// class WarningBanner extends StatelessWidget {
//   final Offset offset;
//   final List<String> listOfStrings;
//   final double? spacing;

//   const WarningBanner({
//     super.key,
//     required this.offset,
//     required this.listOfStrings,
//     this.spacing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const int numOfStripes = 120;

//     // Calculate total content width for proper infinite scrolling
//     final itemWidth = _calculateItemWidth(context);
//     final totalWidth =
//         itemWidth * (listOfStrings.length * 2); // Double for smooth looping

//     return Transform.translate(
//       offset: offset,
//       child: SizedBox(
//         width: totalWidth,
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Top stripes
//                   // const SizedBox(
//                   //   height: 35,
//                   //   child: Row(
//                   //     children: [
//                   //       Expanded(
//                   //         child: CustomPaint(
//                   //           painter: DiagonalStripesPainter(
//                   //             numberOfStripes: numOfStripes,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 60,
//                     child: Row(children: [
//                       ...List.generate(
//                         100,
//                         (index) => Container(
//                           width: 40,
//                           height: 50,
//                           transform: Matrix4.skewX(-.3),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black,
//                             ),
//                             color: Colors.amber,
//                           ),
//                         ),
//                       ),
//                     ]),
//                   ), // Warning text section
//                   Container(
//                     height: 50,
//                     alignment: Alignment.center,
//                     child: Row(
//                       children: [
//                         ...List.generate(
//                           listOfStrings.length * 2,
//                           (index) => Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 BannerText(
//                                   label: listOfStrings[
//                                           index % listOfStrings.length]
//                                       .toUpperCase(),
//                                 ),
//                                 if (index < listOfStrings.length * 2 - 1) ...[
//                                   SizedBox(width: spacing ?? 20),
//                                   const CircleAvatar(
//                                     radius: 8,
//                                     backgroundColor: Colors.white,
//                                   ),
//                                   SizedBox(width: spacing ?? 20),
//                                 ],
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Bottom stripes
//                   const SizedBox(
//                     height: 35,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CustomPaint(
//                             painter: DiagonalStripesPainter(
//                               numberOfStripes: numOfStripes,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double _calculateItemWidth(BuildContext context) {
//     // Calculate the width of a single item including spacing
//     const textStyle = TextStyle(fontSize: 37);
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: listOfStrings.map((s) => s.toUpperCase()).join(),
//         style: textStyle,
//       ),
//       maxLines: 1,
//       textDirection: TextDirection.ltr,
//     )..layout();

//     return textPainter.width +
//         ((spacing ?? 20) * 2) +
//         16; // Add spacing and padding
//   }
// }

// class DiagonalStripesPainter extends CustomPainter {
//   final int numberOfStripes;

//   const DiagonalStripesPainter({
//     required this.numberOfStripes,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2
//       ..style = PaintingStyle.fill;

//     const stripeWidth = 20.0;
//     const stripeSpacing = 15.0;
//     final stripeHeight = size.height;

//     // Calculate visible area with some overflow
//     final visibleWidth = size.width + stripeWidth + stripeSpacing;

//     // Draw stripes with proper spacing and angle
//     for (double x = -stripeWidth;
//         x < visibleWidth;
//         x += (stripeWidth + stripeSpacing)) {
//       final path = Path()
//         ..moveTo(x, 0)
//         ..lineTo(x + stripeWidth, 0)
//         ..lineTo(x + stripeWidth + stripeHeight * 0.5, stripeHeight)
//         ..lineTo(x + stripeHeight * 0.5, stripeHeight)
//         ..close();

//       canvas.drawPath(path, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant DiagonalStripesPainter oldDelegate) {
//     return numberOfStripes != oldDelegate.numberOfStripes;
//   }
// }

// class BannerText extends StatelessWidget {
//   final String label;

//   const BannerText({
//     super.key,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: const TextStyle(
//         fontSize: 37,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
