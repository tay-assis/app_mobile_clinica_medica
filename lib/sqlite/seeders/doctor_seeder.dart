import 'dart:math';

import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:faker/faker.dart';

import '../models/doctor.dart';
import '../DAOs/doctor_dao.dart';

class DoctorSeeder {
  final AppDatabase db;
  final faker = Faker();

  DoctorSeeder(this.db);

  Future<void> run() async {
    final data = await db.doctorDao.selectDoctors();

    if (data.isEmpty) {
      for (int i = 0; i < 10; i++) {
        await db.doctorDao.insertDoctor(
          1,
          'Dr. Gregory House',
          12345634,
          'Casos Impossíveis',
          'https://prodoctor.net/blog/wp-content/uploads/2015/09/seriados-medicos-dr-house.jpg',
        );
        await db.doctorDao.insertDoctor(
          2,
          'Dra. Meredith Grey',
          21345634,
          'Cirurgia Geral',
          'https://upload.wikimedia.org/wikipedia/pt/3/36/Meredith_Grey_foto_promocional.webp',
        );
        await db.doctorDao.insertDoctor(
          2,
          'Dr. Derek Shepherd',
          43215634,
          'Neurocirurgia',
          'https://rollingstone.com.br/media/uploads/derek-shepherd-patrick-dempsey-greys-anatomy-divulgacao.jpg',
        );
        await db.doctorDao.insertDoctor(
          1,
          'Dra. Cristina Yang',
          21345634,
          'Cardioloa',
          'https://s2.glbimg.com/uwtZkUu1jkrPJjsUe8JCGi2zZYI=/e.glbimg.com/og/ed/f/original/2021/05/11/cristina_yang.jpg',
        );
        await db.doctorDao.insertDoctor(
          3,
          'Dr. Cooper Freedman',
          21345634,
          'Pediatria',
          'https://static.wikia.nocookie.net/greysanatomy/images/c/c9/CooperFreedmanS1-1.jpg/revision/latest?cb=20081227104023',
        );
        await db.doctorDao.insertDoctor(
          3,
          'Dra. Addison Montgomery',
          21345634,
          'Obstetrícia',
          'https://i.pinimg.com/474x/fb/01/88/fb0188d3b4e31bd1e88d1caa097a2d9f.jpg',
        );
      }
    }
  }
}
