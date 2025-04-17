import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';


// tabelas:
import 'models/address.dart';
import 'models/clinic.dart';
import 'models/doctor.dart';
import 'models/insurance.dart';
import 'models/patient.dart';
import 'models/doctorInsurance.dart';
import 'models/doctorSchedule.dart';

// DAOs:
import 'DAOs/address_dao.dart';
import 'DAOs/doctor_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Addresses, Clinics, Doctors, Insurances, Patients, DoctorInsurances, Doctorschedule],
  daos: [AddressDao, DoctorDao]
)

// persistent storage
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = Directory('./lib/sqlite');
      if (!dbFolder.existsSync()) {
        dbFolder.createSync(recursive: true); // Creates the directory if it doesn't exist
      }

      final file = File('${dbFolder.path}/app_flutter.sqlite');
      return NativeDatabase.createInBackground(file);
    });
  }
}
