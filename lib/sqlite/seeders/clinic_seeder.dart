import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class ClinicSeeder {
  ClinicSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.clinicDao.selectClinics();

    if (data.isEmpty) {
      await db.clinicDao.insertClinic(
        2,
        1,
        'Princeton-Plainsboro Teaching Clinic',
        00000000,
        'https://upload.wikimedia.org/wikipedia/commons/8/8b/Princeton_Frist_Campus_Center_back.jpg',
      );

      await db.clinicDao.insertClinic(
        3,
        2,
        'Grey Sloan Memorial Clinic',
        00000001,
        'https://static.wikia.nocookie.net/greysanatomy/images/2/2e/Grey%2BSloan-Memorial-Entrance.png/revision/latest?cb=20151012205425',
      );

      await db.clinicDao.insertClinic(
        4,
        3,
        'Seaside Health & Wellness',
        00000002,
        'https://static.wikia.nocookie.net/greysanatomy/images/8/8c/SeasideEntrance.png/revision/latest?cb=20200831200324',
      );
    }
  }
}
