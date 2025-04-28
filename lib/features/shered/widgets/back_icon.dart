import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const BackIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.1;
    final height = size.height * 0.06;

    return Align(
      alignment: Alignment.centerLeft * 1.09,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(width * 0.2),
          child: CustomPaint(painter: _ArrowPainter()),
        ),
      ),
    );
  }
}

// ✅ Coloque essa classe fora da classe BackIcon!
class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF0089FF)
          ..strokeWidth = size.width * 0.1
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(size.width * 0.8, size.height * 0.1);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.9);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
