import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/retangle_result.dart';
import 'package:flutter/material.dart';

// Modelo simples do médico
class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;

  Doctor({required this.name, required this.specialty, required this.imageUrl});
}

// Página com a grade de médicos
class ResultFilter extends StatelessWidget {
  final List<int> doctorsIds;

  ResultFilter({super.key, required this.doctorsIds});

  @override
  Widget build(BuildContext context) {
    // Lista de médicos(será modificado posteriomente por uma lista de ID)
    // final List<Doctor> doctorsList = [
    //   Doctor(
    //     name: 'Dr. Kate Rose',
    //     specialty: 'Pediatra',
    //     imageUrl: 'lib/images/profile.jpg',
    //   ),
    //   Doctor(
    //     name: 'Dr. Kyle Bush',
    //     specialty: 'Cardiologista',
    //     imageUrl: 'https://placehold.co/130x116',
    //   ),
    //   Doctor(
    //     name: 'Dr. Casey Dean',
    //     specialty: 'Dermatologista',
    //     imageUrl: 'https://placehold.co/130x116',
    //   ),
    //   Doctor(
    //     name: 'Dr. Simon Le',
    //     specialty: 'Dermatologista',
    //     imageUrl: 'https://placehold.co/130x116',
    //   ),
    // ];

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
              itemCount: doctorsIds.length,
              itemBuilder: (context, index) {
                final doctorId = doctorsIds[index];
                return DoctorCard(
                  doctorName: 'Id: $doctorId',
                  specialty: 'Test specialty $doctorId',
                  imageUrl: 'lib/images/profile.jpg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
