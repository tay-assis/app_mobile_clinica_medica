import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String clinicName;
  final String doctorName;
  final String specialty;

  const DoctorCard({
    super.key,
    required this.clinicName,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127,
      height: 83,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Stack(
        children: [
          // Fundo azul claro
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 127,
              height: 83,
              decoration: ShapeDecoration(
                color: const Color(0xFFEAF8FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          // Nome da clínica
          Positioned(
            left: 27,
            top: 14,
            child: Text(
              clinicName,
              style: const TextStyle(
                color: Color(0xFF0089FF),
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Nome do médico
          Positioned(
            left: 34,
            top: 41,
            child: Text(
              doctorName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Especialidade
          Positioned(
            left: 43,
            top: 62,
            child: Text(
              specialty,
              style: const TextStyle(
                color: Color(0xFF0089FF),
                fontSize: 6,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
