import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class FilterNameController extends ChangeNotifier {
  final AppDatabase db;
  List<String> _names = [];
  List<String> _specialties = [];
  List<String> _clinicNames = [];
  List<String> _addresses = [];
  bool _loading = false;

  List<String> get names => _names;
  List<String> get specialties => _specialties;
  List<String> get clinicNames => _clinicNames;
  List<String> get addresses => _addresses;
  bool get loading => _loading;

  FilterNameController(this.db);

  Future<void> loadDoctorsAndClinics() async {
    _loading = true;
    notifyListeners();

    final doctors = await db.doctorDao.selectDoctors();
    // doctor names
    _names = doctors.map((d) => d.name).toList();
    // doctor specialties
    _specialties = doctors.map((d) => d.specialty).toList();

    final clinics = await db.clinicDao.selectClinics();
    // clinic names
    _clinicNames = clinics.map((d) => d.name).toList();

    final clinicIds = clinics.map((d) => d.addressId).toList();
    final addresses = await db.addressDao.selectAddressCitiesByIDs(clinicIds);
    // clinic addresses (cities)
    _addresses = addresses;

    _loading = false;
    notifyListeners();
  }

}
