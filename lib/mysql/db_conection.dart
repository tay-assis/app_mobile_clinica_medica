import 'package:mysql_client/mysql_client.dart';

void main() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "password",
      //databaseName: "app_flutter",
    );

    await conn.connect();
    print("✅ Conectado com sucesso!");

    // Criar o schema app_flutter se não existir
    await conn.execute("CREATE DATABASE IF NOT EXISTS app_flutter");

    // Usar o banco de dados
    await conn.execute("USE app_flutter");

    // Mostrar todos os databases
    //var result = await conn.execute("SHOW DATABASES");
    //for (final row in result.rows) {
    //  print("Banco de Dados: ${row.colAt(0)}");
    //}

    await conn.close();
  } 
  catch (e) 
  {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }

}
