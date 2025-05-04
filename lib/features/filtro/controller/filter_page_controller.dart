import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class FilterNameController extends ChangeNotifier {
  final AppDatabase db;
  List<String> _names = [];
  bool _loading = false;

  List<String> get names => _names;
  bool get loading => _loading;

  FilterNameController(this.db);

  Future<void> loadDoctors() async {
    _loading = true;
    notifyListeners();

    final doctors = await db.doctorDao.selectDoctors();
    _names = doctors.map((d) => d.name).toList();

    _loading = false;
    notifyListeners();
  }
}
