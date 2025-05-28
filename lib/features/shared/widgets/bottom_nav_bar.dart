import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final bool showAddIcon;
  final VoidCallback? onAddTap;
  final VoidCallback onHomeTap;
  final VoidCallback onProfileTap;
  final int selectedIndex;
  final bool isDashboardUser;

  const BottomNavBar({
    super.key,
    this.showAddIcon = true,
    this.onAddTap,
    required this.onHomeTap,
    required this.onProfileTap,
    required this.selectedIndex,
    this.isDashboardUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // necessário para efeitos de splash funcionarem
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.05),
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showAddIcon && !isDashboardUser) ...[
                InkWell(
                  onTap: selectedIndex == 1 ? null : onAddTap,
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.blue.withOpacity(0.3),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add, color: Colors.black54, size: 30),
                  ),
                ),
              ],
              InkWell(
                onTap: selectedIndex == 0 ? null : onHomeTap,
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withOpacity(0.3),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home, color: Colors.blue, size: 30),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: selectedIndex == 2 ? null : onProfileTap,
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withOpacity(0.3),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person, color: Colors.black54, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
