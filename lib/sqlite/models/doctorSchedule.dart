import 'package:app_mobile_clinica_medica/sqlite/models/doctor.dart';
import 'package:drift/drift.dart';

@DataClassName('DoctorSchedule')
class Doctorschedule extends Table {
  IntColumn get doctorId => integer().references(Doctors, #crm)();
  TextColumn get weekday =>
      text().customConstraint(
        "CHECK(weekday IN ('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'))",
      )();
  DateTimeColumn get date => dateTime()();
  TextColumn get time => text()();
  TextColumn get status =>
      text().customConstraint(
        "CHECK(status IN ('available', 'unavailable'))",
      )();
  @override
  Set<Column> get primaryKey => {doctorId, date, time};
}
