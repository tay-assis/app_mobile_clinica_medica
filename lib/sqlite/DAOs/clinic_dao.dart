import 'package:drift/drift.dart';
import '../models/clinic.dart';
import '../database.dart';

part 'clinic_dao.g.dart';

@DriftAccessor(tables: [Clinics])
class ClinicDao extends DatabaseAccessor<AppDatabase> with _$ClinicDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  ClinicDao(super.db);

  // É recomendada a leitura da documentação do drift para entendimento dos métodos
  // No C in CRUD, because the tables were already created

  // Clinics RUD
  // SELECT * FROM CLINICS
  Future<List<Clinic>> selectClinics() {
    return select(clinics).get();
  }

  // SELECT * FROM CLINICS WHERE (id == ID)
  Future<Clinic> selectClinicByID(int ID) {
    return (select(clinics)..where(
      (t) => t.id.isValue(ID),
    )).getSingle(); // only one element with specific ID
  }

  Future<Clinic> selectClinicByUID(int UID) {
    return (select(clinics)..where(
      (t) => t.userId.equals(UID),
    )).getSingle(); // only one element with specific ID
  }

  // SELECT COUNT(*) FROM Clinics
  Future<int> lengthClinics() async {
    final query = selectOnly(clinics)..addColumns([clinics.id.count()]);
    final row = await query.getSingle();
    return row.read(clinics.id.count()) ?? 0; // default value is 0
  }

  // INSERT INTO CLINICS (...) VALUES()
  Future<void> insertClinic(
    int USERID, // not firebase, users table
    int ADDRESSID,
    String NAME,
    int PHONE,
    String IMAGEURL,
  ) async {
    into(clinics).insert(
      ClinicsCompanion(
        userId: Value(USERID),
        addressId: Value(ADDRESSID),
        name: Value(NAME),
        phone: Value(PHONE),
        imageUrl: Value(IMAGEURL),
      ),
    );
    return;
  }

  // UPDATE CLINICS name=NAME, ... WHERE (id ==ID)
  Future<void> modifyClinic(
    int ID,
    int ADDRESSID,
    String NAME,
    String IMAGEURL,
    int PHONE,
    int targets,
  ) async {
    // finds the element with id==ID
    // 'targets' represents flags used to know which values will be modified
    // example: targets = 0x110 means only address and name will be modified
    final companion = ClinicsCompanion(
      addressId: ((targets & 0x1000) != 0) ? Value(ADDRESSID) : Value.absent(),
      name: ((targets & 0x0100) != 0) ? Value(NAME) : Value.absent(),
      imageUrl: ((targets & 0x0010) != 0) ? Value(IMAGEURL) : Value.absent(),
      phone: ((targets & 0x001) != 0) ? Value(PHONE) : Value.absent(),
    );

    // single update
    await (update(clinics)..where((t) => t.id.equals(ID))).write(companion);
    return;
  }

  // DELETE FROM CLINICS
  Future<void> deleteClinics() async {
    delete(clinics).go();
    await customStatement(
      "DELETE FROM sqlite_sequence WHERE name = 'clinics';",
    );
    return;
  }

  // DELETE FROM CLINICS WHERE (id == ID)
  Future<void> deleteClinicByID(int ID) async {
    (delete(clinics)..where((t) => t.id.isValue(ID))).go();
    return;
  }
}
