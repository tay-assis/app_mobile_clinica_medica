import 'package:flutter/material.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.05),
        child: Text(
          'Seja\nBem-vindo',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF0089FF),
            fontSize: width * 0.08, // Ajusta dinamicamente com base na largura
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }
}
