import 'package:flutter/material.dart';

enum ButtonStyleType { filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final ButtonStyleType styleType;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.styleType = ButtonStyleType.filled, // Estilo padrão
  });

  @override
  Widget build(BuildContext context) {
    if (styleType == ButtonStyleType.filled) {
      // Estilo preenchido (original)
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: const Color(0xFF0089FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    } else {
      // Estilo contornado (novo)
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0xFF0089FF)),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0089FF),
              fontSize: 12,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
  }
}
