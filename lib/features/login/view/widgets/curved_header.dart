import 'package:flutter/material.dart';

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        height: height * 0.15,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF64B5F6), // Azul claro
              Color(0xFF0288D1), // Azul escuro
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);

    // Curva suave
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width,
      size.height * 0.7,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
