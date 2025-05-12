import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// tables:
import 'models/address.dart';
import 'models/clinic.dart';
import 'models/doctor.dart';
import 'models/insurance.dart';
import 'models/patient.dart';
import 'models/doctorInsurance.dart';
import 'models/doctorSchedule.dart';
import 'models/user.dart';

// DAOs:
import 'DAOs/address_dao.dart';
import 'DAOs/clinic_dao.dart';
import 'DAOs/doctor_dao.dart';
import 'DAOs/insurance_dao.dart';
import 'DAOs/patient_dao.dart';
import 'DAOs/doctorInsurance_dao.dart';
import 'DAOs/doctorSchedule_dao.dart';
import 'DAOs/user_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Addresses,
    Clinics,
    Doctors,
    Insurances,
    Patients,
    DoctorInsurances,
    DoctorSchedules,
    Users,
  ],
  daos: [
    AddressDao,
    ClinicDao,
    DoctorDao,
    InsuranceDao,
    PatientDao,
    DoctorInsuranceDao,
    DoctorScheduleDao,
    UserDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  //Storing info on mobile
  //static LazyDatabase _openConnection() {
  //  return LazyDatabase(() async {
  //    // Obtain a writable directory on the device
  //    final docsDir = await getApplicationDocumentsDirectory();
  //    final dbFolder = Directory(p.join(docsDir.path, 'sqlite'));
  //    if (!await dbFolder.exists()) {
  //      await dbFolder.create(recursive: true);
  //    }
  //
  //    final file = File(p.join(dbFolder.path, 'app_flutter.sqlite'));
  //    return NativeDatabase(file);
  //  });
  //}

  // Storing info on computer
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = Directory('./lib/sqlite');
      if (!dbFolder.existsSync()) {
        dbFolder.createSync(
          recursive: true,
        ); // Creates the directory if it doesn't exist
      }

      final file = File('${dbFolder.path}/app_flutter.sqlite');
      return NativeDatabase.createInBackground(file);
    });
  }
}
