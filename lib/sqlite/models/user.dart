import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get tipo =>
      text().customConstraint(
        "NOT NULL CHECK(tipo IN ('CLINIC', 'PATIENT'))",
      )();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
  TextColumn get firebaseUid =>
      text()
          .nullable()(); // instead of storing passwords firebase can handle this, better for security reasons
}
