import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.005),
        Container(
          width: width * 0.8,
          height: height * 0.055, // <-- Corrigido aqui
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFF00B0FF),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: controller,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.026,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Digite seu e-mail',
              hintStyle: TextStyle(color: Colors.white54),
            ),
            cursorColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
