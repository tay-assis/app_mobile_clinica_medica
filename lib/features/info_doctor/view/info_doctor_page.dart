import 'package:flutter/material.dart';

// Importe os widgets personalizados
import 'package:app_mobile_clinica_medica/features/shared/widgets/doctor_card_image.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/header_close_back.dart';

class InfoDoctorPage extends StatelessWidget {
  const InfoDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header com botão de fechar
            const CustomHeader(
              isCloseButton: false,
              iconColor: Color(0xFF0089FF),
            ),

            const SizedBox(height: 20),

            // Avatar do médico
            const DoctorAvatar(
              imageUrl: 'lib/images/profile.jpg', // Altere para seu path
              radius: 50,
              width: 279,
              height: 279,
            ),

            const SizedBox(height: 20),

            // Nome do médico
            const Text(
              'Dr. Kyle Bush',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            // Especialidade
            const Text(
              'Cardiologist',
              style: TextStyle(
                color: Color(0xFF0089FF),
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),

            // Aqui você pode adicionar os horários, localização, telefone, etc.
            // usando widgets separados ou uma ListView caso a lista cresça.
          ],
        ),
      ),
    );
  }
}
