import 'package:app_mobile_clinica_medica/sqlite/database.dart'; // esse arquivo possui os imports das tabelas
import 'package:drift/drift.dart';


void main() async {
  // Iniciando database Drift
  final db = AppDatabase();

  try {

    // VERIFICACAO existencia da tabela no SQLite do Drift
    //final tables = await db.customSelect('SELECT name FROM sqlite_master WHERE type="table"').get();
    //for (final table in tables) {
    //  print("Tabela: ${table.readString('name')}");
    //}


    // Exemplo de insercao de dados
    print("\n\nElemento inserido na tabela Addresses:\n");
    await db.into(db.addresses).insert(AddressesCompanion(
      street: Value('123 Main St'),
      neighborhood: Value('Downtown'),
      city: Value('Metropolis'),
      state: Value('NY'),
      zipCode: Value(12345),
    ));

    // Query para receber todos os dados da tabela de enderecos
    final addresses = await db.select(db.addresses).get();

    // imprimir tabela de enderecos
    for (final address in addresses) {
      print('ID: ${address.id}, Street: ${address.street}, Neighborhood: ${address.neighborhood}, City: ${address.city}, State: ${address.state}, ZipCode: ${address.zipCode}');
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
