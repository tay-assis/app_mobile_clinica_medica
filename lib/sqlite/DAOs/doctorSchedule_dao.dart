import 'package:drift/drift.dart';
import '../models/doctorSchedule.dart';
import '../database.dart';

part 'doctorSchedule_dao.g.dart';

@DriftAccessor(tables: [DoctorSchedules])
class DoctorScheduleDao extends DatabaseAccessor<AppDatabase> with _$DoctorScheduleDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  DoctorScheduleDao(AppDatabase db) : super(db);

  // extra methods
  // turns string of time into integer number of minutes
  // Ex.: '10:33' -> 633
  int timeToMinutes(String time){
    final hours = int.parse(time.substring(0, 2)); // from index 0 to 2
    final minutes = int.parse(time.substring(3, 5)); // from index 3 to 5
    return hours * 60 + minutes;
  }

  // turns integer number of minutes into string of time
  // Ex.: 734 -> '12:14'
  String minutesToTime(int totalMinutes){
    final hours = totalMinutes ~/ 60; // Integer division
    final minutes = totalMinutes % 60;  // Remainder gives the minutes

    // Convert numbers to a 2-digit string (padded with zeros if needed)
    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr';
  }


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
  Future<DoctorSchedule> selectDoctorScheduleByPrimaryKey(int DOCTORID, DateTime DATE, String TIME){
    return (select(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID) & t.date.isValue(DATE) & t.time.isValue(TIME))).getSingle();
  }

  // eu queria fazer um range de dias, mas não sei usar DateTime.   :(

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorId == DOCTORID && date == DATE && time >= TIME1 && time <= TIME2)
  Future<List<DoctorSchedule>> selectDoctorSchedulesByRangeOfTime(int DOCTORID, DateTime DATE, String TIME1, String TIME2){
    return (select(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID) & t.date.isValue(DATE) & ((timeToMinutes(t.time as String) >= timeToMinutes(TIME1)) as Expression<bool>) & ((timeToMinutes(t.time as String) <= timeToMinutes(TIME2)) as Expression<bool>))).get();
  } // Não tenho certeza se a lógica acima funciona, mas é pra isso q servem os testes, né

  // SELECT COUNT(*) FROM DOCTORSCHEDULES
  Future<int> lengthDoctorSchedules() async {
    final query = selectOnly(doctorSchedules)
      ..addColumns([doctorSchedules.doctorId.count()]);
    final row = await query.getSingle();
    return row.read(doctorSchedules.doctorId.count()) ?? 0; // default value is 0
  }

  // INSERT INTO DOCTORSCHEDULES (...) VALUES(...)
  Future<void> insertDoctorSchedule(int DOCTORID, String WEEKDAY, DateTime DATE, String TIME, String STATUS) async{
    into(doctorSchedules).insert(DoctorSchedulesCompanion(
      doctorId: Value(DOCTORID),
      weekday: Value(WEEKDAY),
      date: Value(DATE),
      time: Value(TIME),
      status: Value(STATUS),
    ));
    return;
  }

  // UPDATE DOCTORSCHEDULES doctorId=DOCTORID, ... WHERE (crm == CRM)
  Future<void> modifyDoctorSchedule(int DOCTORID, String WEEKDAY, DateTime DATE, String TIME, String STATUS, int targets) async{
    final companion = DoctorSchedulesCompanion(
      doctorId: ((targets & 0x10000) != 0) ? Value(DOCTORID) : Value.absent(),
      weekday: ((targets & 0x01000) != 0) ? Value(WEEKDAY) : Value.absent(),
      date: ((targets & 0x00100) != 0) ? Value(DATE) : Value.absent(),
      time: ((targets & 0x00010) != 0) ? Value(TIME) : Value.absent(),
      status: ((targets & 0x00001) != 0) ? Value(STATUS) : Value.absent(),
    );

    // single update
    await (update(doctorSchedules)..where((t) => t.doctorId.equals(DOCTORID) & t.date.isValue(DATE) & t.time.isValue(TIME))).write(companion);
    return;
  }

  // DELETE FROM DOCTORSCHEDULES
  Future<void> deleteDoctorSchedules() async{
    delete(doctorSchedules).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'doctorSchedules';");
    return;
  }

  // DELETE FROM DOCTORSCHEDULES WHERE(doctorId == ID && date == DATE && time == TIME)
  Future<void> deleteDoctorScheduleByID(int DOCTORID, DateTime DATE, String TIME) async{
    (delete(doctorSchedules)..where((t) => t.doctorId.isValue(DOCTORID) & t.date.isValue(DATE) & t.time.isValue(TIME))).go();
    return;
  }
}