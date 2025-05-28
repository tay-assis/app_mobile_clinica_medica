import 'package:flutter/material.dart';

class SingUpClientRegister extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const SingUpClientRegister({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Container(
      width: width * 0.885,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.8, color: Color(0xFF0089FF)),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true, // importante! reduz o espaço interno total
          contentPadding: const EdgeInsets.symmetric(
            vertical: 7.5,
            horizontal: 0,
          ), // padding bem pequeno
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontFamily: 'Nunito',
          ),
        ),
        cursorColor: const Color(0xFF0089FF),
      ),
    );
  }
}
