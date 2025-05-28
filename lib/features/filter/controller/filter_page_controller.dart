import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/sqlite/database.dart';

class FilterNameController extends ChangeNotifier {
  final AppDatabase db;
  List<String> _names = [];
  List<String> _specialties = [];
  List<String> _clinicNames = [];
  List<String> _addresses = [];
  List<String> _insurances = [];
  bool _loading = false;

  List<String> get names => _names;
  List<String> get specialties => _specialties;
  List<String> get clinicNames => _clinicNames;
  List<String> get addresses => _addresses;
  List<String> get insurances => _insurances;
  bool get loading => _loading;

  FilterNameController(this.db);

  Future<void> loadDoctorsAndClinics() async {
    _loading = true;
    notifyListeners();

    final doctors = await db.doctorDao.selectDoctors();
    // doctor names
    _names = doctors.map((d) => d.name).toList();
    // doctor specialties
    _specialties = doctors.map((d) => d.specialty).toList();

    final clinics = await db.clinicDao.selectClinics();
    // clinic names
    _clinicNames = clinics.map((d) => d.name).toList();

    final clinicIds = clinics.map((d) => d.addressId).toList();
    final addresses = await db.addressDao.selectAddressCitiesByIDs(clinicIds);
    // clinic addresses (cities)
    _addresses = addresses;

    final insur = (await db.insuranceDao.selectInsurances()).map((i) => i.name).toList();
    _insurances = insur;


    _loading = false;
    notifyListeners();
  }


  Future<List<int>> applyFilters({
    String? specialty,
    String? clinicName,
    String? location,
    String? doctorName,
    String? insuranceName,
  }) async {

    // start with all doctors, then start "shaving" it
    List<Doctor> DoctorsList = await db.doctorDao.selectDoctors();

    // doctor-related filtering first
    if(specialty != null)
    {
      // limits the list to doctors with a specific specialty
      DoctorsList = DoctorsList.where((d) => d.specialty == specialty).toList();
    }
    if(doctorName != null)
    {
      // specify the list to doctors with a specific name (doctor.name is not unique)
      DoctorsList = DoctorsList.where((d) => d.name == doctorName).toList();
    }


    List<Clinic> ClinicsList = await db.clinicDao.selectClinics();

    if(clinicName != null)
    {
      // limits clinics to their name
      final int clinicResult  = ClinicsList.where((c) => c.name == clinicName).map((c) => c.id).single;

      // after discovering which clinic has this name, update the DoctorsList
      DoctorsList = DoctorsList.where((d) => d.clinicId == clinicResult).toList();
    }
    if(location != null)
    {
      List<Address> AddressesList = await db.addressDao.selectAddresses();
      List<int> clinicIds = [];

      // limits clinics to their location
      for(int i=0; i<ClinicsList.length; i++)
      {
        if((AddressesList.where((a) => a.city == location && a.id == ClinicsList[i].addressId)).isNotEmpty)
        {
          // clinic only wanted if it is on the desired location
          clinicIds.add(ClinicsList[i].id);
        }
      }

      // after discovering which clinics are on the specified location, update the DoctorsList
      DoctorsList = DoctorsList.where((d) => clinicIds.contains(d.clinicId)).toList();
    }


    if(insuranceName != null)
    {
      List<String> insuranceDoctorList = await db.doctorInsuranceDao.selectDoctorsByInsurance(insuranceName);

      DoctorsList = DoctorsList.where((d) => insuranceDoctorList.contains(d.name)).toList();
    }

    // only the Doctors' crm is returned
    return DoctorsList.map((d) => d.crm).toList();
  }

}
