import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../sqlite/database.dart' as local_db;
import 'package:path/path.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final local_db.AppDatabase _db;
  LoginController(this._db);

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> checkUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
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

  Future<local_db.User?> findUser() async {
    final email = emailController.text.trim();

    try {
      final user = await _db.userDao.findByEmail(email);
      //final id = user.id;
      //final type = user.type;
      //print('Id do user: $user.id');
      return user;
    } catch (e) {
      print('Erro achar por email: $e');
    }

    return null;
  }

  Future<String?> userType() async {
    final local_db.User? user = await findUser();

    if (user != null) {
      print('\n \n ${user.tipo} \n \n');
      return user.tipo;
    }

    return null;
  }

  Future<int?> userUid() async {
    final local_db.User? user = await findUser();

    if (user != null) {
      return user.id;
    }

    return -1; //if not found w
  }
}
