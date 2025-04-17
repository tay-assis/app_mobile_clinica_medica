import 'package:app_mobile_clinica_medica/sqlite/database.dart'; // esse arquivo possui os imports das tabelas



void main() async {
  // Iniciando database Drift
  final db = AppDatabase();

  try {

    // VERIFICACAO existencia da tabela no SQLite do Drift
    //final tables = await db.customSelect('SELECT name FROM sqlite_master WHERE type="table"').get();
    //for (final table in tables) {
    //  print("Tabela: ${table.readString('name')}");
    //}


    //print("\n\nElemento inserido na tabela Addresses:\n");
    // Exemplo de insercao de dados
    //await db.into(db.addresses).insert(AddressesCompanion(
    //  street: Value('123 Main St'),
    //  neighborhood: Value('Downtown'),
    //  city: Value('Metropolis'),
    //  state: Value('NY'),
    //  zipCode: Value(12345),
    //));

    print('Criando 2 elementos iguais:');
    // novo insert
    await db.insAdd('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);
    await db.insAdd('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);

    // Query para receber todos os dados da tabela de enderecos e imprimir
    final addresses1 = await db.selAdd();
    for (final i in addresses1) {
      print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
    }
    print('\n');


    int n = await db.lenAdd();
    print('Modificando um segundo elemento ($n elementos):');
    // modifica um elemento
    await db.modAddID(2, 'Estância', 'Águas de Olivença', '', '', 12167, 0x11001);
    final addr1 = await db.selAddID(1);
    print('ID: ${addr1.id}, Street: ${addr1.street}, Neighborhood: ${addr1.neighborhood}, City: ${addr1.city}, State: ${addr1.state}, ZipCode: ${addr1.zipCode}');
    final addr2 = await db.selAddID(2);
    print('ID: ${addr2.id}, Street: ${addr2.street}, Neighborhood: ${addr2.neighborhood}, City: ${addr2.city}, State: ${addr2.state}, ZipCode: ${addr2.zipCode}');
    print('\n');


    print('Deletando elemento de ID = 1:');
    // delete baseado no id
    await db.delAddID(1);

    n = await db.lenAdd();
    print('Elementos sobrando: $n');

    final addresses2 = await db.selAdd();
    for (final i in addresses2) {
      print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
    }


    // esvazia tabela para ter mesmos resultados sempre
    await db.delAdd();
  } 
  catch (e) 
  {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }finally {
    // Ensure the database is closed after usage
    await db.close();
  }

}
