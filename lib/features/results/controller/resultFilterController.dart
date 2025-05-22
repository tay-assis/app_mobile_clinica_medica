import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class ResultFilterController extends ChangeNotifier {
  final AppDatabase db;
  ResultFilterController(this.db);

  Future<List<Doctor>> getDoctorsFromList(List<int> crms) async {
    final result = await db.doctorDao.selectDoctors();
    final docs = result.where((d) => crms.contains(d.crm)).toList();

    print('Tentando achar doutores:$docs');
    // gets the doctors from the List of crms
    return docs;
  }
}
