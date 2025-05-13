import 'package:app_mobile_clinica_medica/features/clinic/widgets/rectangle.dart';
import 'package:app_mobile_clinica_medica/features/login/view/login_page.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/user_header.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/bottom_nav_bar.dart';

class DashboardClinic extends StatelessWidget {
  const DashboardClinic({super.key});

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
              UserHeader(
                //ESSES DADOS SERAO IMPORTADOS DO BACK-END
                //DEVEMOS IMPORTAR IMAGENS???
                name: 'Clínica do Goku (Buscar no BD)',
                subtitle: 'goku@gmail.com (Buscar no BD)',
                showProfileImage: false,
              ),
              SizedBox(height: 30),
              Rectangle(width: 373, height: 250), // Retangulo Azul e Texto
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        showAddIcon: true,
        onAddTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        onHomeTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardClinic()),
          );
        },
        onProfileTap: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
