import 'package:drift/drift.dart';

@DataClassName('Address')
class Addresses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get street => text().withLength(min: 1, max: 50)();
  TextColumn get neighborhood => text().withLength(min: 1, max: 50)();
  TextColumn get city => text().withLength(min: 1, max: 50)();
  TextColumn get state => text().withLength(min: 2, max: 2)();
  IntColumn get zipCode => integer()();
}
