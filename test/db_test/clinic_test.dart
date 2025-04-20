import 'package:app_mobile_clinica_medica/sqlite/database.dart';

Future<void> runClinicTests(AppDatabase db) async {
  final db = AppDatabase(); 
  final clinicDao = ClinicDao(db); 

  print('\t Testing Clinics method \n');

  print('Insert method\n'); 

  await db.clinicDao.insertClinic(
    '1',
    'Hopes Clinic', 
    'https://img.com/hopes.png', 
  );

  await db.clinicDao.insertClinic(
    '2',
    'Faith Clinic', 
    'https://img.com/faith.png',
  ); 

  final clinics = await db.clinicDao.selectClinics();
  for(final i in clinics) {
    print(
      'ID: ${i.id}, Address ID: ${i,addressId}, Name: ${i.name}, Imagem: ${i.imageUrl}\n'
    ); 
  }

  print('\n');

  int n = await db.clinicDao.lengthClinics();
  print('Count: $n');

  final clin1 = await db.clinicDao.selectClinicByID(1);
  final clin2 = await db.clinicDao.selectClinicByID(2);
  print(
      'ID: ${i.id}, Address ID: ${i,addressId}, Name: ${i.name}, Imagem: ${i.imageUrl}\n');
  print(
      'ID: ${i.id}, Address ID: ${i,addressId}, Name: ${i.name}, Imagem: ${i.imageUrl}\n');

  print('Deleting clinic where ID = 1:');
  await db.clinicDao.deleteClinicByID(1);

  n = await db.clinicDao.lengthClinics();
  print('Remaining elements: $n');

  await db.clinicDao.deleteClinics();
  n = await db.clinicDao.lengthClinics();
  print('Remaining elements: $n');

  print('Test on Clinics over\n');

}
