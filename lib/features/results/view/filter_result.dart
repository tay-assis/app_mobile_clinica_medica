import 'package:app_mobile_clinica_medica/features/results/view/widgets/retangle_result.dart';
import 'package:flutter/material.dart';

class ResultFilter extends StatelessWidget {
  const ResultFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Retângulo no topo
          SizedBox(
            width: double.infinity,
            height: 250,
            child: ResultRetangle(
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
          ),

          // Conteúdo principal
        ],
      ),
      //bottomNavigationBar: const BottomNavBar(),
    );
  }
}
