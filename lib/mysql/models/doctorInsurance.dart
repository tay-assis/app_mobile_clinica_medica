import 'package:app_mobile_clinica_medica/mysql/models/doctor.dart';
import 'package:app_mobile_clinica_medica/mysql/models/insurance.dart';
import 'package:drift/drift.dart';

@DataClassName('DoctorInsurance')
class DoctorInsurances extends Table {
  IntColumn get crm => integer().references(Doctors, #crm)();
  IntColumn get insuranceId => integer().references(Insurances, #id)();
  @override
  Set<Column> get primaryKey => {crm, insuranceId};
}
