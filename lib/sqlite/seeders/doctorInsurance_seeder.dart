import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class DoctorInsuranceSeeder {
  DoctorInsuranceSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.doctorInsuranceDao.selectDoctorInsurances();

    if (data.isEmpty) {
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dr. Gregory House',
        'Amil',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dr. Gregory House',
        'Unimed',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dr. Gregory House',
        'São Luiz',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dra. Meredith Grey',
        'São Luiz',
      );
      // Doctor Derek Sheperd only sees private patients
      //await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
      //  'Dr. Derek Shepherd',
      //   null
      //);
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dra. Cristina Yang',
        'Unimed',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dra. Cristina Yang',
        'São Luiz',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dr. Cooper Freedman',
        'Unimed',
      );
      await db.doctorInsuranceDao.insertDoctorInsuranceByNames(
        'Dra. Addison Montgomery',
        'Unimed',
      );
    }
  }
}
