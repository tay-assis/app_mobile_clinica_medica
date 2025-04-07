import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
//import 'package:flutter/material.dart' as material; // using alias because this has a Table class
import 'package:path/path.dart' as p;
//import 'package:path_provider/path_provider.dart';
// tabelas:
import 'models/address.dart';
import 'models/clinic.dart';
import 'models/doctor.dart';
import 'models/insurance.dart';
import 'models/patient.dart';
import 'models/doctorInsurance.dart';
import 'models/doctorSchedule.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Addresses, Clinics, Doctors, Insurances, Patients, DoctorInsurances, Doctorschedule],
)
/* //memory-based
class AppDatabase extends _$AppDatabase {
  // Using an in-memory database
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
*/


// file-based
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = Directory('./sqlite');
      if (!dbFolder.existsSync()) {
        dbFolder.createSync(recursive: true); // Creates the directory if it doesn't exist
      }
      print('Using database path: ${dbFolder.path}'); // Debugging

      final file = File('${dbFolder.path}/app_flutter.sqlite');
      return NativeDatabase.createInBackground(file);
    });
  }
}
