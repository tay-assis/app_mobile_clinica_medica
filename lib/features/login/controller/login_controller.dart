import 'package:flutter/material.dart';
import '../model/usuario_model.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void newUser() {
    final user = UserLogin(
      email: emailController.text,
      senha: passwordController.text,
    );

    // Chamar repositório SQLite aqui
    //PacienteRepository().inserirPaciente(user);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
