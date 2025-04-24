import 'dart:async';

import 'package:app_mobile_clinica_medica/sqlite/DAOs/doctor_dao.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import 'seeders/doctor_seeder.dart';

void main() async {
  // Starting database
  final db = AppDatabase();

  await db.doctorDao.deleteDoctors();

  await DoctorSeeder.run(db);
  final doctors = await db.doctorDao.selectDoctors();
  for (final i in doctors) {
    print(
      'CRM: ${i.crm} Clinic: ${i.clinicId} Name: ${i.name} Phone: ${i.phone} Specialty: ${i.specialty}',
    );
  }

  await db.close();
}
