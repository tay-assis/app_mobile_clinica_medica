import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'D',
            style: TextStyle(
              color: const Color(0xFF045FE9),
              fontSize: 25,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          TextSpan(
            text: 'octor On',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.80,
            ),
          ),
        ],
      ),
    );
  }
}
