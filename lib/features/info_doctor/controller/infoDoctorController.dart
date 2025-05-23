import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class InfoDoctorController {
  final AppDatabase _db;
  InfoDoctorController(this._db);

  Future<Doctor?> getDoctorFromCrm(int crm) async {
    final result = await _db.doctorDao.selectDoctorByCRM(crm);
    try {
      print('INFO DOCTOR: $result');
      // gets the doctor from the crm
      return result;
    } catch (e) {
      print('Erro ao buscar doutor $e');
    }
    print('saimos do try');
    return null;
  }

  Future<Clinic?> getClinicName(int crm) async {
    final cid = (await _db.doctorDao.selectDoctorByCRM(crm))!.clinicId;
    try {
      final clinic = await _db.clinicDao.selectClinicByID(cid);
      print('INFO CLINICA: $clinic');
      return clinic;
    } catch (e) {
      print('Erro ao buscar clinica: $e');
    }
    return null;
  }

  Future<DoctorSchedule> getSchedule(int crm, DateTime time) async {
    return await _db.doctorScheduleDao.selectDoctorScheduleByPrimaryKey(
      crm,
      time,
    );
  }
}
