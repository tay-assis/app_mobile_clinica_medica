import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/search_bar.dart';
import '../../../shared/widgets/rectangle.dart';

class ResultRetangle extends StatelessWidget {
  final double width;
  final double height;

  const ResultRetangle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Retângulo com gradiente de fundo
        GradientRectangle(width: width, height: height),

        // Botão de voltar
        const Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: CustomHeader(isCloseButton: false, iconColor: Colors.white),
        ),

        // Conteúdo principal: Título + Barra de busca
        Padding(
          padding: const EdgeInsets.only(
            top: 90, // mais distante do header, mais perto da searchbar
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Resultados de Consulta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const SearchBarWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
