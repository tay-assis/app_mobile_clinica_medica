import 'package:flutter/material.dart';
import '../../../shered/widgets/rectangle.dart';
import 'circle_icon.dart';
import 'search_bar.dart';

class MainRectangle extends StatelessWidget {
  final double width;
  final double height;

  const MainRectangle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background rectangle
        GradientRectangle(width: width, height: height),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 276,
                height: 84,
                child: const Text(
                  'Encontre seu \nMédico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Icons widgets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const CircleIcon(icon: Icons.favorite),
                    onPressed: () {
                      // Action when the favorite button is pressed
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.monitor_heart),
                    onPressed: () {
                      // Action when the heart monitor button is pressed
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.medical_services),
                    onPressed: () {
                      // Action when the medical services button is pressed
                    },
                  ),
                  IconButton(
                    icon: const CircleIcon(icon: Icons.vaccines),
                    onPressed: () {
                      // Action when the vaccines button is pressed
                    },
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // Widget for the search bar
              SearchBarWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
