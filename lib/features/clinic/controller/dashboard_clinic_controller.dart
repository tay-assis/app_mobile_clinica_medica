import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:flutter/material.dart';

class DashboardClinicController {
  final _db = AppDatabase();

  Future<Clinic?> findClinic(int uid) async {
    try {
      final clinic = await _db.clinicDao.selectClinicByUID(uid);
      return clinic;
    } catch (e) {
      print('Erro ao buscar a clínica: $e');
    }
    return null;
  }

  Future<String?> nameClinic(Clinic clinic) async {
    try {
      print('Nome: ${clinic.name}}');
      return clinic.name;
    } catch (e) {
      print('Erro ao achar o nome da clínica: $e');
    }
    return null;
  }

  Future<String?> streetClinic(Clinic clinic) async {
    try {
      final address = await _db.addressDao.selectAddressesByID(
        clinic.addressId,
      );
      print('Rua: ${address.street}');
      return address.street;
    } catch (e) {
      print('Erro ao achar o endereço da clínica: $e');
    }
    return null;
  }
}
