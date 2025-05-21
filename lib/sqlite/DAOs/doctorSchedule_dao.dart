import 'package:drift/drift.dart';
import '../models/doctorSchedule.dart';
import '../database.dart';

part 'doctorSchedule_dao.g.dart';

@DriftAccessor(tables: [DoctorSchedules])
class DoctorScheduleDao extends DatabaseAccessor<AppDatabase>
    with _$DoctorScheduleDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  DoctorScheduleDao(super.db);

  // doctorSchedule RUD #UNTESTED
  // SELECT * FROM DOCTORSCHEDULES
  Future<List<DoctorSchedule>> selectDoctorSchedules() {
    return select(doctorSchedules).get();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorCrm == DOCTORCRM)
  Future<List<DoctorSchedule>> selectDoctorSchedulesByDoctorCRM(int DOCTORCRM) {
    return (select(doctorSchedules)
      ..where((t) => t.doctorCrm.equals(DOCTORCRM))).get();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorCrm == DOCTORCRM && date == DATE && time == TIME)
  Future<DoctorSchedule> selectDoctorScheduleByPrimaryKey(
    int DOCTORCRM,
    DateTime DATE,
  ) {
    return (select(doctorSchedules)..where(
      (t) => t.doctorCrm.equals(DOCTORCRM) & t.date.equals(DATE),
    )).getSingle();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(doctorCrm == DOCTORCRM && date >= DATE1 && date <= DATE2)
  Future<List<DoctorSchedule>> selectDoctorSchedulesByRangeOfTime(
    int DOCTORCRM,
    DateTime DATE1,
    DateTime DATE2,
  ) {
    return (select(doctorSchedules)..where(
      (t) =>
          t.doctorCrm.equals(DOCTORCRM) &
          t.date.isBiggerOrEqualValue(DATE1) &
          t.date.isSmallerOrEqualValue(DATE2),
    )).get();
  }

  // SELECT * FROM DOCTORSCHEDULES WHERE(range in (DATE1, DATE2), weekday in WEEKDAYLIST, status == 'available')
  Future<List<DoctorSchedule>> selectDoctorSchedulesByAllFilters(
    int DOCTORCRM,
    DateTime DATE1,
    DateTime DATE2,
    List<String> WEEKDAYLIST,
  ) {
    return (select(doctorSchedules)..where(
      (t) =>
          t.doctorCrm.equals(DOCTORCRM) &
          t.date.isBiggerOrEqualValue(DATE1) &
          t.date.isSmallerOrEqualValue(DATE2) &
          t.status.equals('available') &
          (t.weekday.isIn(WEEKDAYLIST)),
    )).get();
  }

  // SELECT COUNT(*) FROM DOCTORSCHEDULES
  Future<int> lengthDoctorSchedules() async {
    final query = selectOnly(doctorSchedules)
      ..addColumns([doctorSchedules.doctorCrm.count()]);
    final row = await query.getSingle();
    return row.read(doctorSchedules.doctorCrm.count()) ??
        0; // default value is 0
  }

  // INSERT INTO DOCTORSCHEDULES (...) VALUES(...)
  Future<void> insertDoctorSchedule(
    int DOCTORCRM,
    String WEEKDAY,
    DateTime DATE,
    String STATUS,
  ) async {
    into(doctorSchedules).insert(
      DoctorSchedulesCompanion(
        doctorCrm: Value(DOCTORCRM),
        weekday: Value(WEEKDAY),
        date: Value(DATE),
        status: Value(STATUS),
      ),
    );
    return;
  }

  // INSERT INTO DOCTORSCHEDULES (...,...,available) VALUES (...)
  // initializes the week
  /*
    For standard, the variable SUNDAY must be the sunday on the week that is being initialized
    START_TIME & END_TIME's day, week and month will be ignored, as the hour is what will be used
  */
  Future<void> initializeWeek(
    int DOCTORCRM,
    DateTime SUNDAY,
    int startHour,
    int endHour,
    List<String> WEEKDAYLIST,
  ) async {
    // defining values
    List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    DateTime currentDay = SUNDAY;

    // for every day of the week, checks if it is used and if so, insert the time
    int i, j;
    for (i = 0; i < 7; i++) {
      if (WEEKDAYLIST.contains(days[i])) {
        // adds appointments on schedule of 1 hour from START to END-1
        for (j = startHour; j < endHour; j++) {
          await insertDoctorSchedule(
            DOCTORCRM,
            days[i],
            DateTime(currentDay.year, currentDay.month, currentDay.day, j, 0),
            'available',
          );
        }
      }
      currentDay = currentDay.add(Duration(days: 1));
    }

    return;
  }

  // UPDATE DOCTORSCHEDULES doctorCrm=DOCTORCRM, ... WHERE (crm == CRM)
  Future<void> modifyDoctorSchedule(
    int DOCTORCRM,
    String WEEKDAY,
    DateTime DATE,
    String STATUS,
    int targets,
  ) async {
    final companion = DoctorSchedulesCompanion(
      doctorCrm: ((targets & 0x1000) != 0) ? Value(DOCTORCRM) : Value.absent(),
      weekday: ((targets & 0x0100) != 0) ? Value(WEEKDAY) : Value.absent(),
      date: ((targets & 0x0010) != 0) ? Value(DATE) : Value.absent(),
      status: ((targets & 0x0001) != 0) ? Value(STATUS) : Value.absent(),
    );

    // single update
    await (update(doctorSchedules)..where(
      (t) => t.doctorCrm.equals(DOCTORCRM) & t.date.equals(DATE),
    )).write(companion);
    return;
  }

  // available -> unavailable WHERE(PrimaryKey == PRIMARYKEY)
  Future<int> occupyAppointment(DOCTORCRM, DATE) async {
    DoctorSchedule TARGET = await selectDoctorScheduleByPrimaryKey(
      DOCTORCRM,
      DATE,
    );

    if (TARGET.status == 'unavailable') {
      return 1; // TARGET IS ALREADY UNAVAILABLE
    }

    await modifyDoctorSchedule(DOCTORCRM, '', DATE, 'unavailable', 0x0001);

    return 0;
  }

  // DELETE FROM DOCTORSCHEDULES
  Future<void> deleteDoctorSchedules() async {
    await delete(doctorSchedules).go();
    await customStatement(
      "DELETE FROM sqlite_sequence WHERE name = 'doctorSchedules';",
    );
    return;
  }

  // DELETE FROM DOCTORSCHEDULES WHERE(doctorCrm == CRM && date == DATE)
  Future<void> deleteDoctorScheduleByPrimaryKey(
    int DOCTORCRM,
    DateTime DATE,
  ) async {
    (delete(doctorSchedules)
      ..where((t) => t.doctorCrm.equals(DOCTORCRM) & t.date.equals(DATE))).go();
    return;
  }
}
