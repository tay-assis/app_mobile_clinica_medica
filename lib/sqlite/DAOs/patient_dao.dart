import 'package:drift/drift.dart';
import '../models/patient.dart';
import '../database.dart';

part 'patient_dao.g.dart';

@DriftAccessor(tables: [Patients])
class PatientDao extends DatabaseAccessor<AppDatabase> with _$PatientDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  PatientDao(super.db);

  // patient RUD #UNTESTED
  // SELECT * FROM PATIENTS
  Future<List<Patient>> selectPatients() {
    return select(patients).get();
  }

  // SELECT * FROM PATIENTS WHERE(id == ID)
  Future<Patient> selectPatientByID(int ID) {
    return (select(patients)..where((t) => t.id.isValue(ID))).getSingle();
  }

  // AVISO!!!
  // o metodo abaixo assume que não existem mais de uma pessoa com o mesmo nome
  // SELECT * FROM PATIENTS WHERE(name == NAME)
  Future<String> selectInsuranceByPatientName(String NAME) async {
    // gets the insurance ID
    Patient vari = await (select(patients)..where((t) => t.name.equals(NAME))).getSingle();

    // gets the insurance row based on ID
    Insurance ins = await db.insuranceDao.selectInsuranceByID(vari.insuranceId);

    // returns the insurance name
    return ins.name;
  }

  // SELECT COUNT(*) FROM PATIENTS
  Future<int> lengthPatients() async {
    final query = selectOnly(patients)..addColumns([patients.id.count()]);
    final row = await query.getSingle();
    return row.read(patients.id.count()) ?? 0; // default value is 0
  }

  // INSERT INTO PATIENTS (...) VALUES(...)
  Future<void> insertPatient(
    int INSURANCEID,
    int ADDRESSID,
    String NAME,
    String EMAIL,
    int PHONE,
  ) async {
    into(patients).insert(
      PatientsCompanion(
        insuranceId: Value(INSURANCEID),
        addressId: Value(ADDRESSID),
        name: Value(NAME),
        email: Value(EMAIL),
        phone: Value(PHONE),
      ),
    );
    return;
  }

  // UPDATE PATIENTS clinicID=CLINICID, ... WHERE (crm == CRM)
  Future<void> modifyPatient(
    int ID,
    int INSURANCEID,
    int ADDRESSID,
    String NAME,
    String EMAIL,
    int PHONE,
    int targets,
  ) async {
    final companion = PatientsCompanion(
      insuranceId:
          ((targets & 0x10000) != 0) ? Value(INSURANCEID) : Value.absent(),
      addressId: ((targets & 0x01000) != 0) ? Value(ADDRESSID) : Value.absent(),
      name: ((targets & 0x00100) != 0) ? Value(NAME) : Value.absent(),
      email: ((targets & 0x00010) != 0) ? Value(EMAIL) : Value.absent(),
      phone: ((targets & 0x00001) != 0) ? Value(PHONE) : Value.absent(),
    );

    // single update
    await (update(patients)..where((t) => t.id.equals(ID))).write(companion);
    return;
  }

  // DELETE FROM PATIENTS
  Future<void> deletePatients() async {
    delete(patients).go();
    await customStatement(
      "DELETE FROM sqlite_sequence WHERE name = 'patients';",
    );
    return;
  }

  // DELETE FROM PATIENTS WHERE(id == ID)
  Future<void> deletePatientByID(int ID) async {
    (delete(patients)..where((t) => t.id.isValue(ID))).go();
    return;
  }
}
