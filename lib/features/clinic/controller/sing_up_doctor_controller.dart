import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpDoctorController {
  final TextEditingController crmController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();

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

  Future<int> newDoctor(int? cid) async {
    //format every controller to put in the insert method from daos
    final crm =
        await checkCrm(); //making sure crm is unique and telling the user
    final nome = nomeController.text.trim();
    final especialidade = especialidadeController.text.trim();

    try {
      if (crm > 0 && cid != null) {
        await _db.doctorDao.insertDoctor(crm, cid, nome, especialidade, '');
      }
    } catch (e) {
      print('Erro ao adicionar médico');
    }

    return crm; //if crm is -1 is because the doctor wasn't inserted or already exists on the database
  }
}
