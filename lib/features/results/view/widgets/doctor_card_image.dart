import 'package:app_mobile_clinica_medica/features/shared/widgets/rectangle.dart';
import 'package:flutter/material.dart';

class DoctorCardImage extends StatelessWidget {
  const DoctorCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 118,
      child: Stack(
        children: [
          GradientRectangle(width: 105, height: 95),
          // Imagem sobre o retângulo
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 130,
              height: 116,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/130x116"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
