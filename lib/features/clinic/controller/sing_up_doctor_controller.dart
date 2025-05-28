import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpDoctorController {
  final TextEditingController crmController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();
  final TextEditingController convenioController = TextEditingController();

  final AppDatabase _db;
  SingUpDoctorController(this._db);

  void dispose() {
    // free controllers from doctor
    crmController.dispose();
    nomeController.dispose();
    especialidadeController.dispose();
  }

  Future<int?> findCid(int uid) async {
    try {
      final clinic = await _db.clinicDao.selectClinicByUID(uid);
      return clinic.id;
    } catch (e) {
      print('Erro ao buscar a clínica: $e');
    }
    return null;
  }

  Future<int> checkCrm() async {
    final crm = int.tryParse(crmController.text.trim());

    try {
      if (crm != null) {
        final doctor = await _db.doctorDao.selectDoctorByCRM(
          crm,
        ); // may there is an more eficiently way

        print('checando doutor $doctor, $crm');
        if (doctor == null) {
          print('doutor nao existe $doctor, $crm');
          return crm; // means crm is unique
        }
        return -2;
      }
    } catch (e) {
      print('CRM nao passou pela checagem: $e');
    }

    return -1;
  }

  Future<int> newDoctor(int? cid, List<String> input) async {
    //format every controller to put in the insert method from daos
    final crm =
        await checkCrm(); //making sure crm is unique and telling the user
    final nome = nomeController.text.trim();
    final especialidade = especialidadeController.text.trim();

    try {
      if (crm != -1 && crm != -2 && cid != null) {
        print('Check if: $crm, $cid');

        print('Tentando inserir médico...');
        await _db.doctorDao.insertDoctor(crm, cid, nome, especialidade, '');
        print('Médico inserido com sucesso.');

        print('Tentando adicionar convênios...');
        await addInsurance(nome, input);
        print('Convênios adicionados com sucesso.');
      }
    } catch (e, stackTrace) {
      print('Erro ao adicionar médico: $e');
      print(stackTrace);
    }
    return crm; //if crm is -1 is because the doctor wasn't inserted or already exists on the database
  }

  Future<void> addInsurance(String name, List<String> input) async {
    final n = input.length;
    final List<String> currentInsurances = (await _db.insuranceDao.selectInsurances()).map((i) => i.name).toList();

    for (int i = 0; i < n; i++) {
      if(!(currentInsurances.contains(input[i]))){
        await _db.insuranceDao.insertInsurance(input[i]);
      }
      await _db.doctorInsuranceDao.insertDoctorInsuranceByNames(name, input[i]);

    }
    final check = await _db.doctorInsuranceDao.selectInsurancesByDoctor(name);
    print('Lista do banco de dados DoctorInsurances: $check');
  }

  Future<List<String>> getInsurancesName() async {
    final result = await _db.insuranceDao.selectInsurances();

    return result.map((i) => i.name).toList();
  }
}
