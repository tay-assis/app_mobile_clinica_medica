import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final bool
  isCloseButton; // true for the close button, false for the back button
  final Color iconColor; // Icon color, default is black

  const CustomHeader({
    super.key,
    required this.isCloseButton,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isCloseButton)
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: iconColor),
              onPressed: () => Navigator.pop(context),
            )
          else
            const SizedBox(width: 48), // Placeholder for back button space

          if (isCloseButton)
            IconButton(
              icon: Icon(Icons.close, color: iconColor, size: 40),
              onPressed: () => Navigator.pop(context),
            )
          else
            const SizedBox(width: 48), // Placeholder for close button space
        ],
      ),
    );
  }
}
