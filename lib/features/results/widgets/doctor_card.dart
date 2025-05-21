import 'package:app_mobile_clinica_medica/features/results/widgets/doctor_card_info.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/doctor_card_image.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imageUrl;
  final String CRM;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
    required this.CRM,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 70,
            child: DoctorInfoCard(
              doctorName: doctorName,
              specialty: specialty,
              CRM: CRM,
            ),
          ),
          DoctorAvatar(imageUrl: imageUrl, radius: 45, width: 95, height: 95),
        ],
      ),
    );
  }
}
