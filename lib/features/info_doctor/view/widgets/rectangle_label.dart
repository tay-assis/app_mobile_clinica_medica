import 'package:flutter/material.dart';

class RectangleLabel extends StatelessWidget {
  final String label;
  final bool isAvailable;

  const RectangleLabel({
    super.key,
    required this.label,
    required this.isAvailable,
  });

  List<Color> getColor() {
    if (isAvailable) {
      return [Color(0xFF00A9FF), Color(0xFF78D1FF)];
    } else {
      return [Color(0xFFBDBDBD), Color(0xFFE0E0E0)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: getColor(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
