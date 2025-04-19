import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final bool isLink;
  final VoidCallback? onTap;

  const FieldLabel({
    super.key,
    required this.text,
    this.isLink = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final label = Text(
      text,
      style: TextStyle(
        color: const Color(0xFF00B0FF),
        fontSize: width * 0.032,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
        decorationColor: isLink ? const Color(0xFF00B0FF) : null,
      ),
    );

    return Padding(
      padding: EdgeInsets.only(left: width * 0.080),
      child:
          isLink && onTap != null
              ? GestureDetector(onTap: onTap, child: label)
              : label,
    );
  }
}
