import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class DoctorScheduleSeeder {
  DoctorScheduleSeeder();

  static Future<void> run(AppDatabase db) async {
    final data = await db.doctorScheduleDao.selectDoctorSchedules();

    // HORARIOS DAS 14-15, 15-16 E 16-17
    if(data.isEmpty){
      List<String> days = ['MON', 'WED', 'FRI'];

      await db.doctorScheduleDao.initializeWeek(
          123,
          DateTime(2025, 5, 4),
          14,
          17,
          days
      );

      await db.doctorScheduleDao.occupyAppointment(123, DateTime(2025, 5, 5, 15, 0));
      await db.doctorScheduleDao.occupyAppointment(123, DateTime(2025, 5, 5, 16, 0));
      await db.doctorScheduleDao.occupyAppointment(123, DateTime(2025, 5, 7, 14, 0));
      await db.doctorScheduleDao.occupyAppointment(123, DateTime(2025, 5, 9, 16, 0));
    }
  }
}