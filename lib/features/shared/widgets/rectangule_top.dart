import 'package:flutter/material.dart';

class GradientRectangleTop extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;

  const GradientRectangleTop({
    super.key,
    required this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.07, -0.10),
          end: const Alignment(1.13, 1.47),
          colors: [const Color(0xFF0089FF), const Color(0xFF5BCCFF)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        shadows: const [
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
      child: child,
    );
  }
}
