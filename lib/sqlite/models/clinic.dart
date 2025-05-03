import 'package:app_mobile_clinica_medica/sqlite/models/address.dart';
import 'package:app_mobile_clinica_medica/sqlite/models/user.dart';
import 'package:drift/drift.dart';

@DataClassName('Clinic')
class Clinics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get addressId => integer().references(Addresses, #id)();
  TextColumn get name => text().withLength(min: 1, max: 50).unique()();
  TextColumn get imageUrl => text().nullable()(); // Campo para armazenar imagem
}
