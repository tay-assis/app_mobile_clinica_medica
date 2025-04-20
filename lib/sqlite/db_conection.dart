import 'package:app_mobile_clinica_medica/sqlite/database.dart'; // esse arquivo possui os imports das tabelas



void main() async {
  // Iniciando database Drift
  final db = AppDatabase();

  try {
    int choice_test = 4;

    switch(choice_test){
      // TESTE ADDRESS
      case 0:

        print('Criando 2 elementos iguais:');
        // novo insert
        await db.addressDao.insertAddress('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);
        await db.addressDao.insertAddress('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);

        // Query para receber todos os dados da tabela de enderecos e imprimir
        final addresses1 = await db.addressDao.selectAddresses();
        for (final i in addresses1) {
          print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
        }
        print('\n');


        int n = await db.addressDao.lengthAddresses();
        print('Modificando um segundo elemento ($n elementos):');
        // modifica um elemento
        await db.addressDao.modifyAddress(2, 'Estância', 'Águas de Olivença', '', '', 12167, 0x11001);
        final addr1 = await db.addressDao.selectAddressByID(1);
        print('ID: ${addr1.id}, Street: ${addr1.street}, Neighborhood: ${addr1.neighborhood}, City: ${addr1.city}, State: ${addr1.state}, ZipCode: ${addr1.zipCode}');
        final addr2 = await db.addressDao.selectAddressByID(2);
        print('ID: ${addr2.id}, Street: ${addr2.street}, Neighborhood: ${addr2.neighborhood}, City: ${addr2.city}, State: ${addr2.state}, ZipCode: ${addr2.zipCode}');
        print('\n');


        print('Deletando elemento de ID = 1:');
        // delete baseado no id
        await db.addressDao.deleteAddressByID(1);

        n = await db.addressDao.lengthAddresses();
        print('Elementos sobrando: $n');

        final addresses2 = await db.addressDao.selectAddresses();
        for (final i in addresses2) {
          print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
        }


        // esvazia tabela para ter mesmos resultados sempre
        await db.addressDao.deleteAddresses();

        break;
      // TESTE DOCTOR
      case 2:

        print('Criando 2 elementos iguais:');
        // novo insert
        await db.doctorDao.insertDoctor(2, 'Dr. House', 12345678, 'Casos impossíveis', null);
        await db.doctorDao.insertDoctor(2, 'Dr. House', 12345678, 'Casos impossíveis', null);

        // Query para receber todos os dados da tabela de enderecos e imprimir
        final doctors1 = await db.doctorDao.selectDoctorsByClinicID(2);
        for (final i in doctors1) {
          print('ClinicID: ${i.clinicId}, Name: ${i.name}, Phone: ${i.phone}, Specialty: ${i.specialty}');
        }
        print('\n');


        int n = await db.doctorDao.lengthDoctors();
        print('Modificando um segundo elemento ($n elementos):');
        // modifica um elemento
        await db.doctorDao.modifyDoctor(2, 0, 'Dr. Watson', 87654321, 'Guerra', null, 0x01110);
        final doct1 = await db.doctorDao.selectDoctorByCRM(1);
        print('ClinicID: ${doct1.clinicId}, Name: ${doct1.name}, Phone: ${doct1.phone}, Specialty: ${doct1.specialty}');
        final doct2 = await db.doctorDao.selectDoctorByCRM(2);
        print('ClinicID: ${doct2.clinicId}, Name: ${doct2.name}, Phone: ${doct2.phone}, Specialty: ${doct2.specialty}');
        print('\n');


        print('Deletando elemento de ID = 1:');
        // delete baseado no id
        await db.doctorDao.deleteDoctorByCRM(1);

        n = await db.doctorDao.lengthDoctors();
        print('Elementos sobrando: $n');

        final doctors2 = await db.doctorDao.selectDoctors();
        for (final i in doctors2) {
          print('ClinicID: ${i.clinicId}, Name: ${i.name}, Phone: ${i.phone}, Specialty: ${i.specialty}');
        }


        // esvazia tabela para ter mesmos resultados sempre
        await db.doctorDao.deleteDoctors();

        break;
      // TESTE DOCTORSCHEDULE
      case 4:

        DateTime date1 = DateTime(2025, 4, 19, 21, 30);
        DateTime date2 = DateTime(2025, 64, 21, 9, 00);

        print('Criando 2 elementos iguais:');
        // novo insert
        await db.doctorScheduleDao.insertDoctorSchedule(2, 'SAT', date1, 'unavailable');
        await db.doctorScheduleDao.insertDoctorSchedule(2, 'MON', date2, 'unavailable');

        // Query para receber todos os dados da tabela de enderecos e imprimir
        final schedules1 = await db.doctorScheduleDao.selectDoctorSchedules();
        for (final i in schedules1) {
          print('doctorID: ${i.doctorId}, Weekday: ${i.weekday}, Date: ${i.date.toIso8601String()}, Status: ${i.status}');
        }
        print('\n');


        int n = await db.doctorScheduleDao.lengthDoctorSchedules();
        print('Modificando um segundo elemento ($n elementos):');
        // modifica um elemento
        await db.doctorScheduleDao.modifyDoctorSchedule(2, 'MON', date2, 'available', 0x0101);
        final sch1 = await db.doctorScheduleDao.selectDoctorScheduleByPrimaryKey(2, date1);
        print('doctorID: ${sch1.doctorId}, Weekday: ${sch1.weekday}, Date: ${sch1.date.toIso8601String()}, Status: ${sch1.status}');
        final sch2 = await db.doctorScheduleDao.selectDoctorScheduleByPrimaryKey(2, date2);
        print('doctorID: ${sch2.doctorId}, Weekday: ${sch2.weekday}, Date: ${sch2.date.toIso8601String()}, Status: ${sch2.status}');
        print('\n');


        print('Deletando elemento de ID = 1:');
        // delete baseado no id
        await db.doctorScheduleDao.deleteDoctorScheduleByPrimaryKey(2, date1);

        n = await db.doctorScheduleDao.lengthDoctorSchedules();
        print('Elementos sobrando: $n');

        // all
        final schedules2 = await db.doctorScheduleDao.selectDoctorSchedules();
        for (final i in schedules2) {
          print('doctorID: ${i.doctorId}, Weekday: ${i.weekday}, Date: ${i.date.toIso8601String()}, Status: ${i.status}');
        }

        // IN RANGE
        final schedules3 = await db.doctorScheduleDao.selectDoctorSchedulesByRangeOfTime(2, DateTime(2025, 4, 10, 00, 00), DateTime(2025, 4, 30, 00, 00));
        for (final i in schedules3) {
          print('doctorID: ${i.doctorId}, Weekday: ${i.weekday}, Date: ${i.date.toIso8601String()}, Status: ${i.status}');
        }
        // OUT OF RANGE
        final schedules4 = await db.doctorScheduleDao.selectDoctorSchedulesByRangeOfTime(2, DateTime(2025, 5, 10, 00, 00), DateTime(2025, 5, 30, 00, 00));
        for (final i in schedules4) {
          print('doctorID: ${i.doctorId}, Weekday: ${i.weekday}, Date: ${i.date.toIso8601String()}, Status: ${i.status}');
        }


        // esvazia tabela para ter mesmos resultados sempre
        await db.doctorScheduleDao.deleteDoctorSchedules();

        break;
      // TESTE PATIENT
      case 6:

        print('Criando 2 elementos iguais:');
        // novo insert
        await db.patientDao.insertPatient(1, 3, 'Elijah Glass', 'Elijah@glass.com', null);
        await db.patientDao.insertPatient(1, 3, 'Elijah Glass', 'Elijah@glass.com', null);

        // Query para receber todos os dados da tabela de enderecos e imprimir
        final patients1 = await db.patientDao.selectPatients();
        for (final i in patients1) {
          print('InsuranceID: ${i.insuranceId}, AddressID: ${i.addressId}, Name: ${i.name}, Phone: ${i.phone != null ? i.phone : "No phone"}');
        }
        print('\n');


        int n = await db.patientDao.lengthPatients();
        print('Modificando um segundo elemento ($n elementos):');
        // modifica um elemento
        await db.patientDao.modifyPatient(2, 0, 2, 'Théoden, son of Thengel', 'Theoden@Rohan.com', 77777777, 0x01111);
        final pat1 = await db.patientDao.selectPatientByID(1);
        print('InsuranceID: ${pat1.insuranceId}, AddressID: ${pat1.addressId}, Name: ${pat1.name}, Phone: ${pat1.phone != null ? pat1.phone : "No phone"}');
        final pat2 = await db.patientDao.selectPatientByID(2);
        print('InsuranceID: ${pat2.insuranceId}, AddressID: ${pat2.addressId}, Name: ${pat2.name}, Phone: ${pat2.phone != null ? pat2.phone : "No phone"}');
        print('\n');


        print('Deletando elemento de ID = 1:');
        // delete baseado no id
        await db.patientDao.deletePatientByID(1);

        n = await db.patientDao.lengthPatients();
        print('Elementos sobrando: $n');

        final patients2 = await db.patientDao.selectPatients();
        for (final i in patients2) {
          print('InsuranceID: ${i.insuranceId}, AddressID: ${i.addressId}, Name: ${i.name}, Phone: ${i.phone != null ? i.phone : "No phone"}');
        }


        // esvazia tabela para ter mesmos resultados sempre
        await db.patientDao.deletePatients();

        break;
      default:
        break;
    }
  } 
  catch (e) 
  {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }finally {
    // Ensure the database is closed after usage
    await db.close();
  }

}
