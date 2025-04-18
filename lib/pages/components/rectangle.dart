import 'package:flutter/material.dart';

class GradientRectangle extends StatelessWidget {
  final double width;
  final double height;

  const GradientRectangle({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * (height / screenHeight),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.03, -0.12),
          end: Alignment(1.12, 1.45),
          colors: [const Color(0xFF0089FF), const Color(0xFF2BBEFF)],
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
