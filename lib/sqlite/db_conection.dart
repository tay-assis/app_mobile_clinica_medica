import 'package:app_mobile_clinica_medica/sqlite/database.dart'; // esse arquivo possui os imports das tabelas



void main() async {
  // Iniciando database Drift
  final db = AppDatabase();

  try {

    print('Criando 2 elementos iguais:');
    // novo insert
    await db.addressDao.insertAddress('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);
    await db.addressDao.insertAddress('Demosthenes Berbert de Castro', 'Sapetinga', 'Ilheus', 'BA', 28657);

    // Query para receber todos os dados da tabela de enderecos e imprimir
    final addresses1 = await db.addressDao.selectAddress();
    for (final i in addresses1) {
      print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
    }
    print('\n');


    int n = await db.addressDao.lengthAddress();
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

    n = await db.addressDao.lengthAddress();
    print('Elementos sobrando: $n');

    final addresses2 = await db.addressDao.selectAddress();
    for (final i in addresses2) {
      print('ID: ${i.id}, Street: ${i.street}, Neighborhood: ${i.neighborhood}, City: ${i.city}, State: ${i.state}, ZipCode: ${i.zipCode}');
    }


    // esvazia tabela para ter mesmos resultados sempre
    await db.addressDao.deleteAddresses();
  } 
  catch (e) 
  {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }finally {
    // Ensure the database is closed after usage
    await db.close();
  }

}
