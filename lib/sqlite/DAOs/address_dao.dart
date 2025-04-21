import 'package:drift/drift.dart';
import '../models/address.dart';
import '../database.dart';

part 'address_dao.g.dart';

@DriftAccessor(tables: [Addresses])
class AddressDao extends DatabaseAccessor<AppDatabase> with _$AddressDaoMixin {
  // You must pass an instance of AppDatabase to the DAO.
  AddressDao(super.db);


  // É recomendada a leitura da documentação do drift para entendimento dos métodos
  // No C in CRUD, because the tables were already created

  // Addresses RUD
  // SELECT * FROM ADDRESSES
  Future<List<Address>> selectAddresses() {
    return select(addresses).get();
  }

  // SELECT * FROM ADDRESSES WHERE (id == ID)
  Future<Address> selectAddressByID(int ID){
    return (select(addresses)..where((t) => t.id.isValue(ID))).getSingle(); // only one element with specific ID
  }

  // SELECT COUNT(*) FROM ADDRESSES
  Future<int> lengthAddresses() async {
    final query = selectOnly(addresses)
      ..addColumns([addresses.id.count()]);
    final row = await query.getSingle();
    return row.read(addresses.id.count()) ?? 0; // default value is 0
  }

  // INSERT INTO ADDRESSES (...) VALUES()
  Future<void> insertAddress(String STREET, String NEIGHBORHOOD, String CITY, String STATE, int ZIPCODE) async {
    into(addresses).insert(AddressesCompanion(
      street: Value(STREET),
      neighborhood: Value(NEIGHBORHOOD),
      city: Value(CITY),
      state: Value(STATE),
      zipCode: Value(ZIPCODE),
    ));
    return;
  }

  // UPDATE ADDRESSES street=STREET, ... WHERE (id ==ID)
  Future<void> modifyAddress(int ID, String STREET, String NEIGHBORHOOD, String CITY, String STATE, int ZIPCODE, int targets) async{
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
  }

  // DELETE FROM ADDRESSES
  Future<void> deleteAddresses() async{
    delete(addresses).go();
    await customStatement("DELETE FROM sqlite_sequence WHERE name = 'addresses';");
    return;
  }

  // DELETE FROM ADDRESSES WHERE (id == ID)
  Future<void> deleteAddressByID(int ID) async{
    (delete(addresses)..where((t) => t.id.isValue(ID))).go();
    return;
  }
}
