import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';

class DashboardUserController {
  final AppDatabase _db;

  DashboardUserController(this._db);

  Future<Patient?> findPatient(int uid) async {
    try {
      final patient = await _db.patientDao.selectPatientByUID(uid);
      return patient;
    } catch (e) {
      print('Erro ao buscar paciente: $e');
    }

    return null;
  }

  Future<String?> patientName(Patient patient) async {
    try {
      return patient.name;
    } catch (e) {
      print('Erro ao achar nome paciente: $e');
    }

    return null;
  }

  Future<String?> patientEmail(int uid) async {
    try {
      return (await _db.userDao.selectUserByID(uid)).email;
    } catch (e) {
      print('Erro ao achar email paciente: $e');
    }

    return null;
  }
}
