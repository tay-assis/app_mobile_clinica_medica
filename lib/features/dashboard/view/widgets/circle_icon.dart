import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;

  const CircleIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Color(0xFF0089FF), size: 20),
    );
  }
}
