import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Justin Nguyen ',
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
              'Male, 18',
              style: TextStyle(
                color: Colors.black.withAlpha(153),
                fontSize: 14,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.40,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('lib/images/profile.jpg'),
        ),
      ],
    );
  }
}
