import 'package:flutter/material.dart';
import '../../../shered/widgets/rectangle.dart';
import 'circle_icon.dart';
import 'search_bar.dart';

class MainRectangle extends StatelessWidget {
  final double width;
  final double height;

  const MainRectangle({super.key, required this.width, required this.height});

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
                  'Encontre seu \nMédico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Linha com componentes de ícones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const CircleIcon(icon: Icons.favorite),
                    onPressed: () {
                      // Ação ao pressionar o botão de favorito
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.monitor_heart),
                    onPressed: () {
                      // Ação ao pressionar o botão de monitor cardíaco
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.medical_services),
                    onPressed: () {
                      // Ação ao pressionar o botão de serviços médicos
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.vaccines),
                    onPressed: () {
                      // Ação ao pressionar o botão de vacinas
                    },
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // Componente de barra de busca
              SearchBarWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
