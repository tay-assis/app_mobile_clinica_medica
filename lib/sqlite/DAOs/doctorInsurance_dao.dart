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

  // select all insurances a doctor atends
  // SELECT insurances.name
  // FROM DOCTORINSURANCES
  // JOIN insurances
  // ON doctorInsuraces.insuranceId = insurances.id
  // WHERE doctorInsurances.crm = CRM
  Future<List<String>> selectInsurancesByDoctor(int CRM) async {
    final query = select(insurances)..where(
      (t) =>
          doctorInsurances.crm.equals(CRM) &
          doctorInsurances.insuranceId.equalsExp(insurances.id),
    );
    final joinQuery = query.join([
      innerJoin(
        insurances,
        doctorInsurances.insuranceId.equalsExp(insurances.id),
      ),
    ]);

    final results = await joinQuery.get();
    return results.map((row) => row.readTable(insurances).name).toList();
  }
}
