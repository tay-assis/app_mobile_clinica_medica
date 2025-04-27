import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class AddressSeeder {
  AddressSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.addressDao.selectAddresses();

    if (data.isEmpty) {
      await db.addressDao.insertAddress(
        //STREET, NEIGHBORHOOD, CITY, STATE, ZIPCODE
        "Rua das Acácias",
        "Jardim Primavera",
        "Campinas",
        "SP",
        13050110,
      );
      await db.addressDao.insertAddress(
        //STREET, NEIGHBORHOOD, CITY, STATE, ZIPCODE
        "Avenida Central",
        "Centro",
        "Belo Horizonte",
        "MG",
        30110000,
      );
      await db.addressDao.insertAddress(
        //STREET, NEIGHBORHOOD, CITY, STATE, ZIPCODE
        "Avenida Júlio Prestes",
        "Barão Geraldo",
        "Campinas",
        "SP",
        13084970,
      );
      await db.addressDao.insertAddress(
        //STREET, NEIGHBORHOOD, CITY, STATE, ZIPCODE
        "Rua das Palmeiras",
        "Taquaral",
        "Campinas",
        "SP",
        13076001,
      );
    }
  }
}
