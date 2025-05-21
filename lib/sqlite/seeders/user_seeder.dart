import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class UserSeeder {
  UserSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.userDao.selectUsers();

    if (data.isEmpty) {
      await db.userDao.insertUser(
        'PATIENT',
        'joaopedro2000@gmail.com',
        'firebase_mock_patient_1',
      );
      await db.userDao.insertUser(
        'CLINIC',
        'princetonclinic@gmail.com',
        'firebase_mock_clinic_1',
      );
      await db.userDao.insertUser(
        'CLINIC',
        'greysloanclinic@gmail.com',
        'firebase_mock_clinic_2',
      );
      await db.userDao.insertUser(
        'CLINIC',
        'seasideclinic@gmail.com',
        'firebase_mock_clinic_3',
      );
    }
  }
}
