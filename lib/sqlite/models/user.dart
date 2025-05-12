import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
  TextColumn get firebaseUid =>
      text()
          .nullable()(); // instead of storing paswords firebase can handle this, better for security reasons
  TextColumn get type =>
      text().customConstraint(
        "NOT NULL CHECK(type IN ('PATIENT', 'CLINIC'))",
      )();
}
