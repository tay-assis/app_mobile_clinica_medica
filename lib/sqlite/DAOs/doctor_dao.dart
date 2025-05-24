import 'package:drift/drift.dart';
import '../models/doctor.dart';
import '../database.dart';

part 'doctor_dao.g.dart';

@DriftAccessor(tables: [Doctors])
class DoctorDao extends DatabaseAccessor<AppDatabase> with _$DoctorDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  DoctorDao(super.db);

  // doctor RUD #UNTESTED
  // SELECT * FROM DOCTORS
  Future<List<Doctor>> selectDoctors() {
    return select(doctors).get();
  }

  // SELECT * FROM DOCTORS WHERE(clinicID == CLINICID)
  Future<List<Doctor>> selectDoctorsByClinicID(int CLINICID) {
    return (select(doctors)..where((t) => t.clinicId.isValue(CLINICID))).get();
  }

  // SELECT * FROM DOCTORS WHERE(crm == CRM)
  Future<Doctor?> selectDoctorByCRM(int CRM) {
    return (select(doctors)
      ..where((t) => t.crm.isValue(CRM))).getSingleOrNull();
  }

  // SELECT COUNT(*) FROM DOCTORS
  Future<int> lengthDoctors() async {
    final query = selectOnly(doctors)..addColumns([doctors.crm.count()]);
    final row = await query.getSingle();
    return row.read(doctors.crm.count()) ?? 0; // default value is 0
  }

  // INSERT INTO DOCTORS (...) VALUES()
  Future<void> insertDoctor(
    int CRM,
    int CLINICID,
    String NAME,
    String SPECIALTY,
    String? IMAGEURL,
  ) async {
    into(doctors).insert(
      DoctorsCompanion(
        crm: Value(CRM),
        clinicId: Value(CLINICID),
        name: Value(NAME),
        specialty: Value(SPECIALTY),
        imageUrl: Value(IMAGEURL),
      ),
    );
    return;
  }

  // UPDATE DOCTORS clinicID=CLINICID, ... WHERE (crm == CRM)
  Future<void> modifyDoctor(
    int CRM,
    int CLINICID,
    String NAME,
    String SPECIALTY,
    String? IMAGEURL,
    int targets,
  ) async {
    final companion = DoctorsCompanion(
      clinicId: ((targets & 0x1000) != 0) ? Value(CLINICID) : Value.absent(),
      name: ((targets & 0x0100) != 0) ? Value(NAME) : Value.absent(),
      specialty: ((targets & 0x0010) != 0) ? Value(SPECIALTY) : Value.absent(),
      imageUrl: ((targets & 0x0001) != 0) ? Value(IMAGEURL) : Value.absent(),
    );

    // single update
    await (update(doctors)..where((t) => t.crm.equals(CRM))).write(companion);
    return;
  }

  // DELETE FROM DOCTORS
  Future<void> deleteDoctors() async {
    delete(doctors).go();
    await customStatement(
      "DELETE FROM sqlite_sequence WHERE name = 'doctors';",
    );
    return;
  }

  // DELETE FROM DOCTORS WHERE(crm == CRM)
  Future<void> deleteDoctorByCRM(int CRM) async {
    (delete(doctors)..where((t) => t.crm.isValue(CRM))).go();
    return;
  }
}
