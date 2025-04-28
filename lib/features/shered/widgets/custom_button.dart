import 'package:flutter/material.dart';

enum ButtonStyleType { filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final ButtonStyleType styleType;
  final double? fontSize; // novo parâmetro

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.styleType = ButtonStyleType.filled,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final double defaultFontSize =
        styleType == ButtonStyleType.filled ? 18 : 12;

    if (styleType == ButtonStyleType.filled) {
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
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? defaultFontSize,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF0089FF)),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0089FF),
              fontSize: fontSize ?? defaultFontSize,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
  }
}
