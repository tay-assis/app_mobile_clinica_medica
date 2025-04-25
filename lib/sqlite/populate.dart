import 'package:app_mobile_clinica_medica/sqlite/database.dart';

import 'seeders/address_seeder.dart';
import 'seeders/clinic_seeder.dart';
import 'seeders/doctor_seeder.dart';
import 'seeders/doctorInsurance_seeder.dart';

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

  //populating insurnances

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
  final houseInsurance = await db.doctorInsuranceDao.selectInsurancesByDoctor(
    '${houseDoctor.name}',
  );
  print('Doctor: ${houseDoctor.name}, \n $houseInsurance');

  // populating DoctorSchedules

  // populating patients

  await db.close();
}
