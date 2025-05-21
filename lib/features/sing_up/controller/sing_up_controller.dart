import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SingUpController {
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
  final TextEditingController phoneCController = TextEditingController();
  final TextEditingController imageCController = TextEditingController();

  //FIREBASE
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AppDatabase _db;
  SingUpController(this._db);

  // VARIABLE FOR UID

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
    phoneCController.dispose();
    imageCController.dispose();
  }

  bool isValidEmail(String email) {
    // regex (got in stackoverflow) to validate email
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    return true;
  }

  bool isValidPassword(String password) {
    // 8 characteres
    if (password.length < 8) return false;

    // at least one upper case
    final uppercaseRegex = RegExp(r'[A-Z]');

    // at least one special character
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!uppercaseRegex.hasMatch(password)) return false;
    if (!specialCharRegex.hasMatch(password)) return false;

    return true;
  }

  Future<int> newUser(String type) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!isValidEmail(email)) {
      print('Email inválido, tente novamente!');
      return -1;
    }
    if (!isValidPassword(password)) {
      print('Senha inválida, mínimo ');
      return -1;
    }

    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUID =
          cred
              .user!
              .uid; //if the autentication process was completed it generated an unique firebaseUID

      // inserting into drift
      final uid = await _db.userDao.insertUser(
        // it should store the userId in UID variable to be used after in newPatient
        type, //identifies which user type to redirect properly to the dashboard
        email,
        firebaseUID,
      ); // we dont store the password because firebase already does that encrypiting

      print('UID: $uid, TIPO:  $type');

      return uid;
    } on FirebaseAuthException catch (e) {
      print('Erro de cadastro: ${e.message}');
    } catch (e) {
      print('Erro banco de dados local : $e');
    }

    return -1;
  }

  Future<int> newPAddress() async {
    final street = enderecoPController.text.trim();
    final neighborhood = bairroPController.text.trim();
    final city = cidadePController.text.trim();
    final state = estadoPController.text.trim();
    final zipCode = int.tryParse(cepPController.text.trim());

    // making sure this field aren't empty
    if (street.isEmpty) {
      print('Erro endereco');
      return -1;
    }
    if (neighborhood.isEmpty) {
      print('Erro bairro');
      return -1;
    }
    if (city.isEmpty) {
      print('Erro cidade');
      return -1;
    }
    if (state.isEmpty) {
      print('Erro estado');
      return -1;
    }
    if (zipCode == null) {
      print('Erro cep');
      return -1;
    }

    try {
      final addressId = await _db.addressDao.returnAddress(
        street,
        neighborhood,
        city,
        state,
        zipCode,
      );
      return addressId;
    } catch (e) {
      print('Erro ao adicionar endereço: $e');
    }

    return -1; // if error returns -1 as an inexistent ID -> check in patient and in clinic that if address_id = -1 error
  }

  Future<int> newCAddress() async {
    final street = enderecoCController.text.trim();
    final neighborhood = bairroCController.text.trim();
    final city = cidadeCController.text.trim();
    final state = estadoCController.text.trim();
    final zipCode = int.tryParse(cepCController.text.trim());

    if (zipCode == null) {
      print('Erro cep');
      return -1;
    }

    try {
      final addressId = await _db.addressDao.returnAddress(
        street,
        neighborhood,
        city,
        state,
        zipCode,
      );
      return addressId;
    } catch (e) {
      print('Erro ao adicionar endereço: $e');
    }

    return -1; // if error returns -1 as an inexistent ID -> check in patient and in clinic that if address_id = -1 error
  }

  Future<int> chooseInsurance(
    bool isOtherInsurance, //se o check ta on
    bool isSelected, // se foi selecionado
    String selectedInsurance, //valor selecionado ou valor inserido
  ) async {
    print('$isOtherInsurance, $isSelected, $selectedInsurance');
    //final insuranceName = convenioController.text.trim();
    if (isSelected) {
      final insuranceId = await _db.insuranceDao.returnInsurance(
        selectedInsurance,
      );
      return insuranceId;
    } else if (isOtherInsurance) {
      final insuranceId = await _db.insuranceDao.insertAndReturnInsurance(
        selectedInsurance,
      );
      return insuranceId;
    }
    return -1; // if error returns -1 as an inexistent ID -> check in patient and in clinic that if address_id = -1 error
  }

  Future<bool> newPatient(
    int uid,
    bool isOtherInsurance,
    bool isSelected,
    String selectedInsurance,
  ) async {
    final name = nomePController.text.trim();

    final address = await newPAddress();
    final insurance = await chooseInsurance(
      isOtherInsurance,
      isSelected,
      selectedInsurance,
    );
    try {
      if (address != -1 && insurance != -1) {
        await _db.patientDao.insertPatient(
          uid, // references users table, not firebase
          address,
          insurance,
          name,
        );
        return true;
      } else {
        print('\n Erro de endereço id ou convenio id \n');

        return false;
      }
    } catch (e) {
      print('Erro banco de dados local: $e');
    }
    return false;
  }

  Future<List<String>> getInsurancesName() async {
    final result = await _db.insuranceDao.selectInsurances();

    return result.map((i) => i.name).toList();
  }

  Future<bool> newClinic(int uid) async {
    final name = nomeCController.text.trim();
    final phone = int.tryParse(phoneCController.text.trim());
    final image = imageCController.text.trim();

    final address = await newCAddress();

    print('$name, $phone, $uid, $address');

    try {
      if (address != -1 && phone != null) {
        // tive que adicionar o phone não nulo para tirar erro
        await _db.clinicDao.insertClinic(uid, address, name, phone, image);
        return true;
      } else {
        print('\n Erro de endereço id \n');

        return false;
      }
    } catch (e) {
      print('\n Erro banco de dados local: $e \n');
    }
    return false;
  }
}
