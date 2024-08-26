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

import 'package:flutter/material.dart';

class WarningBanner extends StatelessWidget {
  //   final ScrollController scrollController;
  // final List<String> listOfStrings;
  // final double? spacing;

  // const WarningBanner({super.key, required this.scrollController, required this.listOfStrings, this.spacing});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: Size(double.infinity, 40),
          painter: DiagonalStripesPainter(),
        ),
        Center(
          child: Text(
            'WARNING • WARNING',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Transform.flip(
          flipX: true,
          child: CustomPaint(
            size: Size(double.infinity, 40),
            painter: DiagonalStripesPainter(),
          ),
        )
      ],
    );
  }
}

class DiagonalStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    double stripeWidth = 20;
    double stripeSpacing = 40;

    for (double i = -size.height; i < size.width; i += stripeSpacing) {
      final path = Path()
        ..moveTo(i, 0)
        ..lineTo(i + stripeWidth, 0)
        ..lineTo(i + size.height + stripeWidth, size.height)
        ..lineTo(i + size.height, size.height)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
