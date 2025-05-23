import 'package:flutter/material.dart';

class RectangleLabel extends StatelessWidget {
  final String label;

  const RectangleLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF00A9FF), Color(0xFF78D1FF)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
