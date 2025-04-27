import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class InsuranceSeeder {
  InsuranceSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.insuranceDao.selectInsurances();

    if(data.isEmpty){
      await db.insuranceDao.insertInsurance(
          'Amil');

      await db.insuranceDao.insertInsurance(
          'Unimed');

      await db.insuranceDao.insertInsurance(
          'São Luiz');
    }
  }
}