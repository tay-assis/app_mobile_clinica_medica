import 'package:app_mobile_clinica_medica/mysql/models/address.dart';
import 'package:drift/drift.dart';

@DataClassName('Clinic')
class Clinics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get addressId => integer().references(Addresses, #id)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get imageUrl => text().nullable()(); // Campo para armazenar imagem
}
