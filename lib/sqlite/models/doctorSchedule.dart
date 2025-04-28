import 'package:app_mobile_clinica_medica/sqlite/models/doctor.dart';
import 'package:drift/drift.dart';

@DataClassName('DoctorSchedule')
class DoctorSchedules extends Table {
  IntColumn get doctorCrm => integer().references(Doctors, #crm)();
  TextColumn get weekday =>
      text().customConstraint(
        "NOT NULL CHECK(weekday IN ('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'))",
      )();
  DateTimeColumn get date => dateTime()();
  TextColumn get status =>
      text().customConstraint(
        "NOT NULL CHECK(status IN ('available', 'unavailable'))",
      )();
  @override
  Set<Column> get primaryKey => {doctorCrm, date};
}
