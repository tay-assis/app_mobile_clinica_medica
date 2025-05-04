import '../../../sqlite/DAOs/doctor_dao.dart';
// import '../../../sqlite/models/doctor.dart';

class FilterNameController {
  final DoctorDao _doctorDao;

  FilterNameController(this._doctorDao);

  Future<List<String>> getDoctorNames() async {
    final doctors = await _doctorDao.selectDoctors();
    print('DOCTORS FROM DB: $doctors');
    return doctors.map((doctor) => doctor.name).toList();
  }
}
