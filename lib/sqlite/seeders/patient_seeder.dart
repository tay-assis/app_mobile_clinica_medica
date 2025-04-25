import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class PatientSeeder {
  PatientSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.patientDao.selectPatients();

    if(data.isEmpty){
      await db.patientDao.insertPatient(
          1,
          4,
          'João Pedro Santos',
          'joaopedro2000@gmail.com',
          31347879);
    }
  }
}