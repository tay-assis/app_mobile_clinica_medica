import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class InfoDoctorController extends ChangeNotifier {
  final AppDatabase db;

  InfoDoctorController(this.db);

  Doctor? doc;

  Future<Doctor> getDoctorsFromList(int crm) async
  {
    final result = await db.doctorDao.selectDoctorByCRM(crm);

    doc = result;

    // gets the doctor from the crm
    return result;
  }

  Future<DoctorSchedule> getSchedule(int crm, DateTime time) async
  {
      return await db.doctorScheduleDao.selectDoctorScheduleByPrimaryKey(crm, time);
  }
}