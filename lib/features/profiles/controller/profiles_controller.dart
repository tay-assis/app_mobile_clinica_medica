import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class ProfilesController {
  final AppDatabase _db;
  ProfilesController(this._db);

  Future<User?> findUser(int uid) async {
    try {
      final user = await _db.userDao.selectUserByID(uid);
      return user;
    } catch (e) {
      print('Erro achar por userId: $e');
    }
    return null;
  }

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

  Future<int?> phoneClinic(Clinic clinic) async {
    try {
      print('Phone: ${clinic.phone}}');
      return clinic.phone;
    } catch (e) {
      print('Erro ao achar o telefone da clínica: $e');
    }
    return null;
  }

  Future<Patient?> findPatient(int uid) async {
    try {
      final patient = await _db.patientDao.selectPatientByUID(uid);
      return patient;
    } catch (e) {
      print('Erro ao buscar paciente: $e');
    }

    return null;
  }

  Future<String?> patientName(Patient patient) async {
    try {
      return patient.name;
    } catch (e) {
      print('Erro ao achar nome paciente: $e');
    }

    return null;
  }

  Future<String?> streetPatient(Patient patient) async {
    try {
      final address = await _db.addressDao.selectAddressesByID(
        patient.addressId,
      );
      print('Rua: ${address.street}');
      return address.street;
    } catch (e) {
      print('Erro ao achar o endereço do paciente: $e');
    }
    return null;
  }

  Future<void> signOutUser() async {
    await auth.FirebaseAuth.instance.signOut();
  }
}
