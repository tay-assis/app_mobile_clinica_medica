import 'package:app_mobile_clinica_medica/sqlite/models/user.dart';
import 'package:app_mobile_clinica_medica/sqlite/models/address.dart';
import 'package:app_mobile_clinica_medica/sqlite/models/insurance.dart';
import 'package:drift/drift.dart';

@DataClassName('Patient')
class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get insuranceId => integer().references(Insurances, #id)();
  IntColumn get addressId => integer().references(Addresses, #id)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  //TextColumn get email => text().withLength(min: 1, max: 50)();
  //IntColumn get phone => integer().unique()();
}
