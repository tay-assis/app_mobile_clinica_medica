import 'package:drift/drift.dart';
import '../models/insurance.dart';
import '../database.dart';

part 'insurance_dao.g.dart';

@DriftAccessor(tables: [Insurances])
class InsuranceDao extends DatabaseAccessor<AppDatabase>
    with _$InsuranceDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  InsuranceDao(super.db);

  // Clinics CRUD
  // SELECT * FROM INSURANCES
  Future<List<Insurance>> selectInsurances() {
    return select(insurances).get();
  }

  // SELECT * FROM INSURANCES WHERE (id == ID)
  Future<Insurance> selectInsuranceByID(int ID) {
    return (select(insurances)..where(
      (t) => t.id.isValue(ID),
    )).getSingle(); // only one element with specific ID
  }

  // SELECT COUNT(*) FROM INSURANCES
  Future<int> lengthInsurances() async {
    final query = selectOnly(insurances)..addColumns([insurances.id.count()]);
    final row = await query.getSingle();
    return row.read(insurances.id.count()) ?? 0; // default value is 0
  }

  // INSERT INTO CLINICS (...) VALUES()
  Future<void> insertInsurance(String NAME) async {
    into(insurances).insert(InsurancesCompanion(name: Value(NAME)));
    return;
  }

  // UPDATE INSURANCES name=NAME ... WHERE (id ==ID)
  Future<void> modifyName(int ID, String NAME, int targets) async {
    // finds the element with id==ID
    // 'targets' represents flags used to know which values will be modified
    // example: targets = 0x110 means only address and name will be modified
    final companion = InsurancesCompanion(
      name: ((targets & 0x1) != 0) ? Value(NAME) : Value.absent(),
    );

    // single update
    await (update(insurances)..where((t) => t.id.equals(ID))).write(companion);
    return;
  }

  // DELETE FROM INSURANCES
  Future<void> deleteInsurances() async {
    delete(insurances).go();
    await customStatement(
      "DELETE FROM sqlite_sequence WHERE name = 'insurances';",
    );
    return;
  }

  // DELETE FROM INSURANCES WHERE (id == ID)
  Future<void> deleteInsuranceByID(int ID) async {
    (delete(insurances)..where((t) => t.id.isValue(ID))).go();
    return;
  }
}
