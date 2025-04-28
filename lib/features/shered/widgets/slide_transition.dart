import 'package:flutter/material.dart';

void navigateWithSlideTransition({
  required BuildContext context,
  required Widget destination,
  Offset beginOffset = const Offset(1.0, 0.0), // padrão: da direita
}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, animation, __) => destination,
      transitionsBuilder: (_, animation, __, child) {
        const curve = Curves.easeInOut;
        var tween = Tween(
          begin: beginOffset,
          end: Offset.zero,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}
