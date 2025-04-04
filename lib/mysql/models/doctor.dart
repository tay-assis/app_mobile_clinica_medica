import 'package:app_mobile_clinica_medica/mysql/models/clinic.dart';
import 'package:drift/drift.dart';

@DataClassName('Doctor')
class Doctors extends Table {
  IntColumn get crm => integer().autoIncrement()();
  IntColumn get clinicId => integer().references(Clinics, #id)();
  TextColumn get name => text().nullable()();
  IntColumn get phone => integer().nullable()();
  TextColumn get specialty => text().withLength(min: 1, max: 50)();
  TextColumn get imageUrl => text().nullable()(); // Campo para armazenar imagem
}
