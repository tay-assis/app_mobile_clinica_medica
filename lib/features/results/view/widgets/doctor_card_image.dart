import 'package:flutter/material.dart';

class DoctorAvatar extends StatelessWidget {
  final String imageUrl;

  const DoctorAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFF0089FF)),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
