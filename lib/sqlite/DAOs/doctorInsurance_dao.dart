import 'package:drift/drift.dart';
import '../models/doctorInsurance.dart';
import '../database.dart';

part 'doctorInsurance_dao.g.dart';

@DriftAccessor(tables: [DoctorInsurances])
class DoctorInsuranceDao extends DatabaseAccessor<AppDatabase>
    with _$DoctorInsuranceDaoMixin {
  // instance of AppDatabase to DAO
  DoctorInsuranceDao(AppDatabase db) : super(db);

  //SELECT * FROM DOCTORINSURANCES
  Future<List<DoctorInsurance>> selectDoctorInsurances() {
    return select(doctorInsurances).get();
  }

  // SELECT insurance.name
  // FROM DOCTORINSURANCES
  // WHERE doctorInsurance.crm = doctor.crm
  // get all insurances a doctor attends
  //Future<List<DoctorInsurance>> selectDoctorInsuranceByCRM(int CRM) {
  //  return (select(doctorInsurances)
  //    ..where((t) => t.crm.isValue(CRM)
  //  )).get();
  //}
  //
  //// SELECT doctor.name, insurance.name
  //// FROM DOCTORINSURANCES
  //// WHERE doctorInsurance.crm = doctor.crm
  //// AND doctorInsurance.insuranceID = insurance.id
  //// get all insurances a doctor attends
  //Future<List<DoctorInsurance>> selectDoctorInsuranceByCRM(int CRM) {
  //  return (select(doctorInsurances)
  //    ..where((t) => t.crm.isValue(CRM)
  //  )).get();
  //}
}
