import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/retangle_result.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:app_mobile_clinica_medica/features/results/controller/resultFilterController.dart';
import 'package:flutter/material.dart';

// Página com a grade de médicos
class ResultFilter extends StatelessWidget {
  final List<int> doctorsCRMs;
  final List<Doctor> doctorList = ;

  ResultFilter({super.key, required this.doctorsCRMs});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Cabeçalho com título e busca
          ResultRetangle(
            width: MediaQuery.of(context).size.width,
            height: 250,
            returnHome: true,
          ),

          // Espaçamento entre o cabeçalho e a lista de médicos
          const SizedBox(height: 20),

          // Lista de médicos
          Expanded(
            child: GridView.builder(
              // Cria uma grade de médicos
              // com espaçamento entre os itens
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              // Exibe o widgets com a foto e a informação do médico
              // de acordo com a quantidade de médicos na lista
              itemCount: doctorsCRMs.length,
              itemBuilder: (context, index) {
                final doctorCRM = doctorsCRMs[index];
                return DoctorCard(
                  doctorName: 'CRM: $doctorCRM',
                  specialty: 'Test specialty $doctorCRM',
                  imageUrl: 'lib/images/profile.jpg',
                  CRM: doctorCRM.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
