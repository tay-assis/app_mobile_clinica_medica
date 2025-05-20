import 'package:flutter/material.dart';

class DoctorInfoCard extends StatelessWidget {
  final String doctorName;
  final String specialty;

  const DoctorInfoCard({
    super.key,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 130,
      decoration: ShapeDecoration(
        color: const Color(0xFFEAF8FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 8),
        child: Column(
          children: [
            Text(
              doctorName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              specialty,
              style: const TextStyle(
                color: Color(0xFF0089FF),
                fontSize: 10,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xFF0089FF),
              ),
              onPressed: () {
                // Ação do botão
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
