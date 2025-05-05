import 'package:app_mobile_clinica_medica/features/sing_up/model/signUp_model.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpController {
  // USER
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // CLIENT
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController convenioController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  // CLINIC
  final TextEditingController cnpjController = TextEditingController();

  //FIREBASE
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = AppDatabase();

  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    senhaController.dispose();
    emailController.dispose();
    convenioController.dispose();
  }

  Future<bool> newUser() async {
    final email = emailController.text.trim();
    final paswword = passwordController.text.trim();

    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUID =
          cred
              .user!
              .uid; //if the autentication process was completed it generated an unique UserId

      // inserting into drift
      await _db.userDao.insertUser(
        signIn.email,
        firebaseUID,
      ); // we dont store the password because firebase already does that encrypiting

      return true;
    } on FirebaseAuthException catch (e) {
      print('Erro de cadastro: ${e.message}');
    }

    return false;
  }
}
