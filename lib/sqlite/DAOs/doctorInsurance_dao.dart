import 'package:drift/drift.dart';
import '../models/doctorInsurance.dart';
import '../database.dart';

part 'doctorInsurance_dao.g.dart';

@DriftAccessor(tables: [DoctorInsurances])
class DoctorInsuranceDao extends DatabaseAccessor<AppDatabase>
    with _$DoctorInsuranceDaoMixin {
  // instance of AppDatabase to DAO
  DoctorInsuranceDao(super.db);

    // SELECT * FROM DOCTORINSURANCES
    Future<List<DoctorInsurance>> selectDoctorInsurances() {
      return select(doctorInsurances).get();
    }

    // SELECT insurances.name
    // from doctorInsurances
    // join insurances 
    // on doctorInsurances.insuranceId = insurances.id
    Future<List<String>> selectInsurancesByDoctor(String doctorName) async {
      // search doctor with name
      final doctor = await (select(doctors)..where((t) => t.name.equals(doctorName))).getSingleOrNull();
      // if exists
      if(doctor != null){
        // select which insurances have doctor.crm equal to the doctor searched
        final query = select(doctorInsurances).join([
          innerJoin(insurances, insurances.id.equalsExp(doctorInsurances.insuranceId)),
        ])
          ..where(doctorInsurances.crm.equals(doctor.crm));

        final results = await query.get();

        // return the insurances names in table mode
        return results.map((row) => row.readTable(insurances).name).toList();
      }else {
        throw Exception("Médico não encontrado.");
      }
      
    }

    Future<List<String>> selectDoctorsByInsurance(String insuranceName) async {
       // search insurance with name
      final insurance = await (select(insurances)..where((t) => t.name.equals(insuranceName))).getSingleOrNull();
      if(insurance != null){
        // select which doctors have insurance.id equal to the insurance searched
        final query = select(doctorInsurances).join([
          innerJoin(doctors, doctors.crm.equalsExp(doctorInsurances.crm)),
        ])
          ..where(doctorInsurances.insuranceId.equals(insurance.id));

        final results = await query.get();

        // return the doctors names in table mode
        return results.map((row) => row.readTable(doctors).name).whereType<String>().toList(); //where remove nulls 
      }else {
        throw Exception("Convênio não encontrado.");
      }
      
    }

    // INSERT INTO DOCTORINSURANCES (crm, insuranceId)
    Future<void> insertDoctorInsuranceByIds(int crm, int insuranceId) async {
      await into(doctorInsurances).insert(
        DoctorInsurancesCompanion(
          crm: Value(crm),
          insuranceId: Value(insuranceId),
        ),
      );
    }

    // INSERT usando nome do médico e do convênio
    Future<void> insertDoctorInsuranceByNames(String doctorName, String insuranceName) async {
      final doctor = await (select(doctors)..where((t) => t.name.equals(doctorName))).getSingleOrNull();
      final insurance = await (select(insurances)..where((t) => t.name.equals(insuranceName))).getSingleOrNull();

      if (doctor != null && insurance != null) {
        await insertDoctorInsuranceByIds(doctor.crm, insurance.id);
      } else {
        throw Exception("Médico ou Convênio não encontrado.");
      }
    }

    // DELETE WHERE crm = crm
    Future<void> deleteDoctorInsuranceByCRM(int crm) async {
      await (delete(doctorInsurances)..where((t) => t.crm.equals(crm))).go();
    }

    // DELETE WHERE insuranceId = id
    Future<void> deleteDoctorInsuranceByID(int insuranceId) async {
      await (delete(doctorInsurances)..where((t) => t.insuranceId.equals(insuranceId))).go();
    }

    // DELETE usando nome do médico
    Future<void> deleteDoctorInsuranceByDoctorsName(String doctorName) async {
      final doctor = await (select(doctors)..where((t) => t.name.equals(doctorName))).getSingleOrNull();

      if (doctor != null) {
        await deleteDoctorInsuranceByCRM(doctor.crm);
      } else {
        throw Exception("Médico não encontrado.");
      }
    }

    // DELETE usando nome do convênio
    Future<void> deleteDoctorInsuranceByInsurancesName(String insuranceName) async {
      final insurance = await (select(insurances)..where((t) => t.name.equals(insuranceName))).getSingleOrNull();

      if (insurance != null) {
        await deleteDoctorInsuranceByID(insurance.id);
      } else {
        throw Exception("Convênio não encontrado.");
      }
    }

    // DELETE * FROM DOCTORINSURANCES
    Future<void> deleteDoctorInsurances() async {
      await delete(doctorInsurances).go();
      await customStatement("DELETE FROM sqlite_sequence WHERE name = 'doctorInsurances';");
    }
}
