import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final bool showProfileImage;
  final String name;
  final String subtitle;

  const UserHeader({
    super.key,
    required this.name,
    required this.subtitle,
    this.showProfileImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.60,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.40,
              ),
            ),
          ],
        ),
        if (showProfileImage)
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('lib/images/default_profile.jpg'),
          ),
      ],
    );
  }
}
