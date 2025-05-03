import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/usuario_model.dart';
import '../../../sqlite/database.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //void newUser() {
  //  final user = UserLogin(
  //    email: emailController.text,
  //    senha: passwordController.text,
  //  );
  //
  //  // Chamar repositório SQLite aqui
  //  //PacienteRepository().inserirPaciente(user);
  //}

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> checkUser() async {
    final userLogin = UserLogin(
      email:
          emailController.text
              .trim(), // the usage of trim() is so spaces before and after the string will be removed
      senha:
          passwordController.text
              .trim(), // the usage of trim() is so spaces before and after the string will be removed
    );

    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: userLogin.email,
        password: userLogin.senha,
      );

      final user = cred.user;

      if (user != null) {
        print('User validated');

        return true;
      }
    } on FirebaseAuthException catch (e) {
      print('Erro de Login: ${e.message}'); // if not validated we send an error
    }

    return false;
  }
}
