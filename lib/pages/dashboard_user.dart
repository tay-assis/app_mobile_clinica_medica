import 'package:app_mobile_clinica_medica/pages/components/rectangule_top.dart';
import 'package:flutter/material.dart';

class DashboardUser extends StatelessWidget {
  const DashboardUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(), // move 100px do topo
        child: GradientRectangleTop(widthPercentage: 1, heightPercentage: 0.3),
      ),
    );
  }
}
