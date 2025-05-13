import 'package:app_mobile_clinica_medica/features/clinic/widgets/label.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/rectangle.dart';

class Rectangle extends StatelessWidget {
  final double width;
  final double height;

  const Rectangle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background rectangle
        GradientRectangle(width: width, height: height),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 276,
                height: 84,
                child: const Text(
                  'Médicos registrados \nna sua Clínica',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 65),

              SearchInputField(hintText: 'Buscar médico'),
            ],
          ),
        ),
      ],
    );
  }
}
