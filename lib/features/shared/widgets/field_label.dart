import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final bool isLink;
  final VoidCallback? onTap;

  /// Alinhamento horizontal: use Alignment.centerLeft, center, ou centerRight
  final Alignment alignment;

  /// Padding horizontal para refinar o posicionamento
  final double horizontalPadding;

  const FieldLabel({
    super.key,
    required this.text,
    this.isLink = false,
    this.onTap,
    this.alignment = Alignment.center,
    this.horizontalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final label = Text(
      text,
      style: TextStyle(
        color: const Color(0xFF00B0FF),
        fontSize: 17,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
        decorationColor: isLink ? const Color(0xFF00B0FF) : null,
      ),
    );

    final content =
        isLink && onTap != null
            ? GestureDetector(onTap: onTap, child: label)
            : label;

    return Container(
      width: double.infinity,
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: content,
    );
  }
}
