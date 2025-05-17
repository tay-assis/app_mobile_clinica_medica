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

      print('Nome: $clinicName, Endereço: $clinicStreet');
    } catch (e) {
      print('Erro ao buscar a clinica: $e');
    }

    return;
  }

  Future<String?> nameClinic() async {
    try {
      print('Nome: $clinicName');
      return clinicName;
    } catch (e) {
      print('Erro ao achar o nome da clínica: $e');
    }
    return null;
  }

  Future<String?> streetClinic() async {
    try {
      print('Rua: $clinicStreet');
      return clinicStreet;
    } catch (e) {
      print('Erro ao achar o endereço da clínica: $e');
    }
    return null;
  }
}
