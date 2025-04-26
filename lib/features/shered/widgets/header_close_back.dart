import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final bool isCloseButton; // true para botão X, false para botão <
  final Color iconColor; // cor do ícone

  const CustomHeader({
    super.key,
    required this.isCloseButton,
    this.iconColor = Colors.black, // cor padrão preta, se não passar
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
            const SizedBox(width: 48), // espaço para alinhar

          if (isCloseButton)
            IconButton(
              icon: Icon(Icons.close, color: iconColor, size: 40),
              onPressed: () => Navigator.pop(context),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
