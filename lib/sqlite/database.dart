import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';


// tabelas:
import 'models/address.dart';
import 'models/clinic.dart';
import 'models/doctor.dart';
import 'models/insurance.dart';
import 'models/patient.dart';
import 'models/doctorInsurance.dart';
import 'models/doctorSchedule.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Addresses, Clinics, Doctors, Insurances, Patients, DoctorInsurances, Doctorschedule],
)

// persistent storage
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = Directory('./lib/sqlite');
      if (!dbFolder.existsSync()) {
        dbFolder.createSync(recursive: true); // Creates the directory if it doesn't exist
      }

      final file = File('${dbFolder.path}/app_flutter.sqlite');
      return NativeDatabase.createInBackground(file);
    });
  }

  // É recomendada a leitura da documentação do drift para entendimento dos métodos
  // No C in CRUD, because the tables were already created
  // Addresses RUD
  Future<List<Address>> selAdd() {
    return select(addresses).get();
  } // READ [ALL]
  Future<Address> selAddID(int ID){
    return (select(addresses)..where((t) => t.id.isValue(ID))).getSingle(); // only one element with specific ID
  } // READ [ID]
  Future<int> lenAdd() async {
    final query = selectOnly(addresses)
      ..addColumns([addresses.id.count()]);
    final row = await query.getSingle();
    return row.read(addresses.id.count()) ?? 0; // default value is 0
  }

  Future<void> insAdd(String STREET, String NEIGHBORHOOD, String CITY, String STATE, int ZIPCODE) async {
    into(addresses).insert(AddressesCompanion(
      street: Value(STREET),
      neighborhood: Value(NEIGHBORHOOD),
      city: Value(CITY),
      state: Value(STATE),
      zipCode: Value(ZIPCODE),
    ));
    return;
  } // UPDATE [ADD]
  Future<void> modAddID(int ID, String STREET, String NEIGHBORHOOD, String CITY, String STATE, int ZIPCODE, int targets) async{
    // finds the element with id==ID
    // 'targets' represents flags used to know which values will be modified
    // example: targets = 0x10010 means only street and state will be modified
    final companion = AddressesCompanion(
      street: ((targets & 0x10000) != 0) ? Value(STREET) : Value.absent(),
      neighborhood: ((targets & 0x01000) != 0) ? Value(NEIGHBORHOOD) : Value.absent(),
      city: ((targets & 0x00100) != 0) ? Value(CITY) : Value.absent(),
      state: ((targets & 0x00010) != 0) ? Value(STATE) : Value.absent(),
      zipCode: ((targets & 0x00001) != 0) ? Value(ZIPCODE) : Value.absent(),
    );

    // single update
    await (update(addresses)..where((t) => t.id.equals(ID))).write(companion);
    return;
  } // UPDATE [MOD]

  Future<void> delAdd() async{
    delete(addresses).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'addresses';");
    return;
  } // DELETE [ALL]
  Future<void> delAddID(int ID) async{
    (delete(addresses)..where((t) => t.id.isValue(ID))).go();
    return;
  } // DELETE [ID]


  // doctor RUD #UNTESTED
  Future<List<Doctor>> selDoc(){
    return select(doctors).get();
  } // READ [ALL]
  Future<List<Doctor>> selDocCli(int CLINICID){
    return (select(doctors)..where((t) => t.clinicId.isValue(CLINICID))).get();
  } // READ [CLINICID]
  Future<Doctor> selDocCRM(int CRM){
    return (select(doctors)..where((t) => t.crm.isValue(CRM))).getSingle();
  } // READ [CRM]

  Future<void> insDoc(int CLINICID, String NAME, int PHONE, String SPECIALTY, String IMAGEURL) async{
    into(doctors).insert(DoctorsCompanion(
      clinicId: Value(CLINICID),
      name: Value(NAME),
      phone: Value(PHONE),
      specialty: Value(SPECIALTY),
      imageUrl: Value(IMAGEURL),
    ));
    return;
  } // UPDATE [ADD]
  Future<void> modDocCRM(int CRM, int CLINICID, String NAME, int PHONE, String SPECIALTY, String IMAGEURL, int targets) async{
    final companion = DoctorsCompanion(
      clinicId: ((targets & 0x10000) != 0) ? Value(CLINICID) : Value.absent(),
      name: ((targets & 0x01000) != 0) ? Value(NAME) : Value.absent(),
      phone: ((targets & 0x00100) != 0) ? Value(PHONE) : Value.absent(),
      specialty: ((targets & 0x00010) != 0) ? Value(SPECIALTY) : Value.absent(),
      imageUrl: ((targets & 0x00001) != 0) ? Value(IMAGEURL) : Value.absent(),
    );

    // single update
    await (update(doctors)..where((t) => t.crm.equals(CRM))).write(companion);
    return;
  } // UPDATE [MOD]

  Future<void> delDoc() async{
    delete(doctors).go();
    return;
  } // DELETE [ALL]
  Future<void> delDocCRM(int CRM) async{
    (delete(doctors)..where((t) => t.crm.isValue(CRM))).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'doctors';");
    return;
  } // DELETE [CRM]
}
