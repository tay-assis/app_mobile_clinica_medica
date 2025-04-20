import 'package:flutter/material.dart';

class GradientRectangleTop extends StatelessWidget {
  final double widthPercentage;
  final double heightPercentage;

  const GradientRectangleTop({
    super.key,
    required this.widthPercentage,
    required this.heightPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * widthPercentage,
      height: screenHeight * heightPercentage,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.07, -0.10),
          end: Alignment(1.13, 1.47),
          colors: [const Color(0xFF0089FF), const Color(0xFF5BCCFF)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 1,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}

// class GradientRectangle2 extends StatelessWidget {
//   final double widthPercentage;
//   final double heightPercentage;

//   const GradientRectangle2({
//     super.key,
//     required this.widthPercentage,
//     required this.heightPercentage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       width: screenWidth * widthPercentage,
//       height: screenHeight * heightPercentage,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF0089FF), Color(0xFF5CCCFF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//     );
//   }
// }
