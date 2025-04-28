import 'package:flutter/material.dart';

class SingUpController {
  // CLIENT
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController convenioController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  // CLINIC
  final TextEditingController cnpjController = TextEditingController();

  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    senhaController.dispose();
    emailController.dispose();
    convenioController.dispose();
  }
}
