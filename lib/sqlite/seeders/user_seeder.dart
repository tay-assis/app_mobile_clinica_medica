import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSeeder {
  UserSeeder();

  static Future<void> run(AppDatabase db) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final data = await db.userDao.selectUsers();

    late final UserCredential joao;
    late final UserCredential princeton;
    late final UserCredential greysloan;
    late final UserCredential seaside;

    if (data.isEmpty) {
      try {
        joao = await _auth.createUserWithEmailAndPassword(
          email: 'joaopedro2000@gmail.com',
          password: 'Password123.',
        );

        princeton = await _auth.createUserWithEmailAndPassword(
          email: 'princetonclinic@gmail.com',
          password: 'Password123.',
        );

        greysloan = await _auth.createUserWithEmailAndPassword(
          email: 'greysloanclinic@gmail.com',
          password: 'Password123.',
        );

        seaside = await _auth.createUserWithEmailAndPassword(
          email: 'seasideclinic@gmail.com',
          password: 'Password123.',
        );
      } catch (e) {
        print('pena');
      }

      await db.userDao.insertUser(
        'PATIENT',
        'joaopedro2000@gmail.com',
        'brbqV4vqZmdC479e5oot1G84gDz1',
      );

      await db.userDao.insertUser(
        'CLINIC',
        'princetonclinic@gmail.com',
        'n3TAUEgYr9fqWYl9wGXDF0uNLJn1',
      );

      await db.userDao.insertUser(
        'CLINIC',
        'greysloanclinic@gmail.com',
        'j7lckXrFedUXGw4wIhywfpJKFrN2',
      );

      await db.userDao.insertUser(
        'CLINIC',
        'seasideclinic@gmail.com',
        '2aWxVfsxnKewahHY1WiDi7FD46v1',
      );
    }
  }
}
