import 'package:flutter/material.dart';
import 'rectangle.dart';
import 'circle_icon.dart';
import 'search_bar.dart';

class MainRetangle extends StatelessWidget {
  final double width;
  final double height;

  const MainRetangle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                  'Let’s Find Your\nDoctor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ⬅️ Linha com componentes de ícones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleIcon(icon: Icons.favorite),
                  CircleIcon(icon: Icons.monitor_heart),
                  CircleIcon(icon: Icons.medical_services),
                  CircleIcon(icon: Icons.vaccines),
                ],
              ),

              const SizedBox(height: 20),

              // ⬅️ Componente de barra de busca
              const SearchBarComponent(),
            ],
          ),
        ),
      ],
    );
  }
}
