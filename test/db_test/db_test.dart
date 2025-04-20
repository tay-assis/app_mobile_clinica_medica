import 'clinic_test.dart';

Future<void> main() async {
  final db = AppDatabase(); 

  try{
    await runClinicTests(db); 
  } catch (e) {
    print('Error during tests : $e');
  } finally {
    await.db.close(); 
  }
}