import 'package:app_mobile_clinica_medica/sqlite/database.dart';
import 'package:app_mobile_clinica_medica/sqlite/seeders/user_seeder.dart';

import 'seeders/address_seeder.dart';
import 'seeders/insurance_seeder.dart';
import 'seeders/clinic_seeder.dart';
import 'seeders/doctor_seeder.dart';
import 'seeders/doctorInsurance_seeder.dart';
import 'seeders/doctorSchedule_seeder.dart';
import 'seeders/patient_seeder.dart';

class DatabaseSeeder {
  /// Creates, seeds, and returns a single AppDatabase instance.
  static Future<AppDatabase> seed() async {
    // 1️⃣ Instantiate DB
    final db = AppDatabase();

    //await db.userDao.deleteUsers();
    await UserSeeder.run(db);

    // 2️⃣ Wipe & seed tables (in dev—skip deletes in production)
    //await db.addressDao.deleteAddresses();
    await AddressSeeder.run(db);

    //await db.insuranceDao.deleteInsurances();
    await InsuranceSeeder.run(db);

    //await db.clinicDao.deleteClinics();
    await ClinicSeeder.run(db);

    //await db.doctorDao.deleteDoctors();
    await DoctorSeeder.run(db);

    //await db.doctorInsuranceDao.deleteDoctorInsurances();
    await DoctorInsuranceSeeder.run(db);

    //await db.doctorScheduleDao.deleteDoctorSchedules();
    await DoctorScheduleSeeder.run(db);

    //await db.patientDao.deletePatients();
    await PatientSeeder.run(db);

    // 3️⃣ Return the seeded database
    return db;
  }
}
