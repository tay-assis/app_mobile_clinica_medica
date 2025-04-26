import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/main_rectangle.dart';
import 'package:app_mobile_clinica_medica/features/shered/widgets/user_header.dart';
import 'package:flutter/material.dart';
import '../../shered/widgets/bottom_nav_bar.dart';

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
              UserHeader(), // Header with user information like name and profile picture
              SizedBox(height: 20),
              MainRectangle(
                width: 373,
                height: 250,
              ), // Main rectangle with gradient background and icons
              // others widgets can be added here, example images, health tips, etc.
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
