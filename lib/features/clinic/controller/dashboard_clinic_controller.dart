import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';

class DashboardClinicController {
  final _db = AppDatabase();

  late String clinicName;

  late String clinicStreet;

  Future<void> findClinic(int uid) async {
    try {
      final clinic = await _db.clinicDao.selectClinicByID(uid);

      clinicName = clinic.name;

      final address = await _db.addressDao.selectAddressesByID(
        clinic.addressId,
      );

      clinicStreet = address.street;
    } catch (e) {
      print('Erro ao buscar a clinica: $e');
    }

    return;
  }
}
