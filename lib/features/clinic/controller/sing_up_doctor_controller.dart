import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpDoctorController {
  // USER
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // PATIENT
  final TextEditingController nomePController = TextEditingController();
  final TextEditingController convenioController = TextEditingController();
  final TextEditingController enderecoPController = TextEditingController();
  final TextEditingController bairroPController = TextEditingController();
  final TextEditingController cidadePController = TextEditingController();
  final TextEditingController estadoPController = TextEditingController();
  final TextEditingController cepPController = TextEditingController();
  //final TextEditingController telefoneController = TextEditingController();

  // CLINIC
  final TextEditingController nomeCController = TextEditingController();
  final TextEditingController enderecoCController = TextEditingController();
  final TextEditingController bairroCController = TextEditingController();
  final TextEditingController cidadeCController = TextEditingController();
  final TextEditingController estadoCController = TextEditingController();
  final TextEditingController cepCController = TextEditingController();

  //FIREBASE
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = AppDatabase();

  void dispose() {
    // free controllers from user
    emailController.dispose();
    passwordController.dispose();

    // free controllers from patients
    nomePController.dispose();
    convenioController.dispose();
    enderecoPController.dispose();
    // numberPController.dispose();
    bairroPController.dispose();
    cidadePController.dispose();
    estadoPController.dispose();
    cepPController.dispose();
    // no use for telefone until now
    //telefoneController.dispose();

    // free controllers from clinics
    nomeCController.dispose();
    enderecoCController.dispose();
    // numberCController.dispose();
    bairroCController.dispose();
    cidadeCController.dispose();
    estadoCController.dispose();
    cepCController.dispose();
  }

  Future<bool> newUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

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
        email,
        firebaseUID,
      ); // we dont store the password because firebase already does that encrypiting

      return true;
    } on FirebaseAuthException catch (e) {
      print('Erro de cadastro: ${e.message}');
    } catch (e) {
      print('Erro banco de dados local : $e');
    }

    return false;
  }

  Future<bool> newPatient() async {
    final name = nomePController.text.trim();
    final insurance =
        convenioController.text
            .trim(); // not text because we want the patient to select which insurance
    final street = enderecoPController.text.trim();
    final neighborhood = bairroPController.text.trim();
    final city = cidadePController.text.trim();
    final state = estadoPController.text.trim();
    final zipCode = int.parse(cepCController.text.trim());
    // final phone = telefoneController.text.trim(); we will delete telefone from database, no use

    try {
      await _db.addressDao.insertAddress(
        street,
        neighborhood,
        city,
        state,
        zipCode,
      );
      //await _db.patientDao.insertPatient(USERID, INSURANCEID, ADDRESSID, name, PHONE)
    } catch (e) {
      print('Erro banco de dados local: $e');
    }
    return false;
  }
}
