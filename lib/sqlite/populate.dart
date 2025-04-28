import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import 'seeders/address_seeder.dart';
import 'seeders/insurance_seeder.dart';
import 'seeders/clinic_seeder.dart';
import 'seeders/doctor_seeder.dart';
import 'seeders/doctorInsurance_seeder.dart';
import 'seeders/doctorSchedule_seeder.dart';
import 'seeders/patient_seeder.dart';

// before merging w dev remove the selection of the seeders. And remove the deleteDoctors() when in production

void main() async {
  // Starting database
  final db = AppDatabase();

  //populating addresses
  await db.addressDao.deleteAddresses();

  await AddressSeeder.run(db);
  final addresses = await db.addressDao.selectAddresses();
  for (final i in addresses) {
    print(
      'Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZIP: ${i.zipCode}',
    );
  }

  //populating insurances
  await db.insuranceDao.deleteInsurances();

  await InsuranceSeeder.run(db);

  // populating clinics
  await db.clinicDao.deleteClinics();

  await ClinicSeeder.run(db);

  // populating doctors
  await db.doctorDao.deleteDoctors();

  await DoctorSeeder.run(db);

  final doctors = await db.doctorDao.selectDoctors();
  for (final i in doctors) {
    print(
      'CRM: ${i.crm} Clinic: ${i.clinicId} Name: ${i.name} Phone: ${i.phone} Specialty: ${i.specialty}',
    );
  }

  //populating DoctorInsurances
  await db.doctorInsuranceDao.deleteDoctorInsurances();

  await DoctorInsuranceSeeder.run(db);
  final houseDoctor = await db.doctorDao.selectDoctorByCRM(123);
  final List<String> houseInsurance = await db.doctorInsuranceDao.selectInsurancesByDoctor(
    houseDoctor.name,
  );
  print('Doctor: ${houseDoctor.name}, \n $houseInsurance');

  // populating doctorSchedules
  await db.doctorScheduleDao.deleteDoctorSchedules();

  await DoctorScheduleSeeder.run(db);


  List<String> days = ['MON', 'WED']; // WILL NOT SHOW FRIDAY
  final houseHours = await db.doctorScheduleDao.selectDoctorSchedulesByAllFilters( // THIS FUNCTION ONLY SHOWS WHAT'S AVAILABLE
      123,
      DateTime(2025, 5, 4, 0, 0),   // SUNDAY
      DateTime(2025, 5, 10, 0, 0),  // SATURDAY
      days
  );
  for(final i in houseHours){
    print('Weekday: ${i.weekday},  Date: ${i.date}, Status: ${i.status}');
  }

  // populating patients
  await db.patientDao.deletePatients();

  await PatientSeeder.run(db);

  final jao = await db.patientDao.selectPatientByID(1);
  print('Nome: ${jao.name}, Email: ${jao.email}, phone: ${jao.phone}, convênio: ${await db.patientDao.selectInsuranceByPatientName(jao.name)}');

  await db.close();
}
