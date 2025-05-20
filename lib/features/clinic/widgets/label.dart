import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const SearchInputField({
    super.key,
    this.hintText = 'Buscar médico',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
