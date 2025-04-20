import 'package:drift/drift.dart';
import '../models/doctorSchedule.dart';
import '../database.dart';

part 'doctorSchedule_dao.g.dart';

@DriftAccessor(tables: [DoctorSchedules])
class DoctorScheduleDao extends DatabaseAccessor<AppDatabase> with _$DoctorScheduleDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  DoctorScheduleDao(AppDatabase db) : super(db);

  // doctorSchedule RUD #UNTESTED
  // SELECT * FROM DOCTORSCHEDULES
  Future<List<DoctorSchedule>> selectDoctorSchedules(){
    return select(doctorSchedules).get();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorId == DOCTORID)
  Future<List<DoctorSchedule>> selectDoctorSchedulesByDoctorID(int DOCTORID){
    return (select(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID))).get();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorId == DOCTORID && date == DATE && time == TIME)
  Future<DoctorSchedule> selectDoctorScheduleByPrimaryKey(int DOCTORID, DateTime DATE){
    return (select(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID) & t.date.isValue(DATE))).getSingle();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorId == DOCTORID && date >= DATE1 && date <= DATE2)
  Future<List<DoctorSchedule>> selectDoctorSchedulesByRangeOfTime(int DOCTORID, DateTime DATE1, DateTime DATE2){
    return (select(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID) & t.date.isBiggerOrEqualValue(DATE1) & t.date.isSmallerOrEqualValue(DATE2))).get();
  }

  // SELECT COUNT(*) FROM DOCTORSCHEDULES
  Future<int> lengthDoctorSchedules() async {
    final query = selectOnly(doctorSchedules)
      ..addColumns([doctorSchedules.doctorId.count()]);
    final row = await query.getSingle();
    return row.read(doctorSchedules.doctorId.count()) ?? 0; // default value is 0
  }

  // INSERT INTO DOCTORSCHEDULES (...) VALUES(...)
  Future<void> insertDoctorSchedule(int DOCTORID, String WEEKDAY, DateTime DATE, String STATUS) async{
    into(doctorSchedules).insert(DoctorSchedulesCompanion(
      doctorId: Value(DOCTORID),
      weekday: Value(WEEKDAY),
      date: Value(DATE),
      status: Value(STATUS),
    ));
    return;
  }

  // UPDATE DOCTORSCHEDULES doctorId=DOCTORID, ... WHERE (crm == CRM)
  Future<void> modifyDoctorSchedule(int DOCTORID, String WEEKDAY, DateTime DATE, String STATUS, int targets) async{
    final companion = DoctorSchedulesCompanion(
      doctorId: ((targets & 0x10000) != 0) ? Value(DOCTORID) : Value.absent(),
      weekday: ((targets & 0x01000) != 0) ? Value(WEEKDAY) : Value.absent(),
      date: ((targets & 0x00100) != 0) ? Value(DATE) : Value.absent(),
      status: ((targets & 0x00001) != 0) ? Value(STATUS) : Value.absent(),
    );

    // single update
    await (update(doctorSchedules)..where((t) => t.doctorId.equals(DOCTORID) & t.date.isValue(DATE))).write(companion);
    return;
  }

  // DELETE FROM DOCTORSCHEDULES
  Future<void> deleteDoctorSchedules() async{
    await delete(doctorSchedules).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'doctorSchedules';");
    return;
  }

  // DELETE FROM DOCTORSCHEDULES WHERE(doctorId == ID && date == DATE)
  Future<void> deleteDoctorScheduleByPrimaryKey(int DOCTORID, DateTime DATE) async{
    (delete(doctorSchedules)..where((t) => t.doctorId.equals(DOCTORID) & t.date.equals(DATE))).go();
    return;
  }
}