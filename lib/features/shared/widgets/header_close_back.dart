import 'package:app_mobile_clinica_medica/features/dashboard/view/dashboard_user.dart';
import 'package:app_mobile_clinica_medica/features/clinic/view/dashboard_clinic.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final bool
  isCloseButton; // true for the close button, false for the back button
  final Color iconColor; // Icon color, default is black
  final bool returnHome;
  final int uid;
  final bool isClinic;

  const CustomHeader({
    super.key,
    required this.isCloseButton,
    this.iconColor = Colors.black,
    this.returnHome = false,
    this.uid = 1,
    this.isClinic = false,
  });

  void handleNavigation(BuildContext context) {
    if (returnHome) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => isClinic? DashboardClinic(uid: uid) : DashboardUser(uid: uid)),
        (route) => false,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isCloseButton)
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: iconColor),
              onPressed: () => handleNavigation(context),
            )
          else
            const SizedBox(width: 48), // Placeholder for back button space

          if (isCloseButton)
            IconButton(
              icon: Icon(Icons.close, color: iconColor, size: 40),
              onPressed: () => handleNavigation(context),
            )
          else
            const SizedBox(width: 48), // Placeholder for close button space
        ],
      ),
    );
  }
}
