import 'package:flutter/material.dart';

class SingUpController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController convenioController = TextEditingController();

  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    senhaController.dispose();
    emailController.dispose();
    convenioController.dispose();
  }
}
