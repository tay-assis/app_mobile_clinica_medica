import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/main_retangle.dart';
import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/user_header.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_nav_bar.dart';

class DashboardUser extends StatelessWidget {
  const DashboardUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              UserHeader(),
              SizedBox(height: 20),
              MainRetangle(width: 373, height: 250),
              // outros componentes abaixo, se necessário
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
