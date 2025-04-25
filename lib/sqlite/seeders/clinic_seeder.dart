import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class ClinicSeeder {
  ClinicSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.clinicDao.selectClinics();

    if(data.isEmpty){
      await db.clinicDao.insertClinic(
          1,
          'Princeton-Plainsboro Teaching Clinic',
          'IMAGEURL');

      await db.clinicDao.insertClinic(
          2,
          'Grey Sloan Memorial Clinic',
          'IMAGEURL');

      await db.clinicDao.insertClinic(
          3,
          'Seaside Health & Wellness',
          'IMAGEURL');
    }
  }
}