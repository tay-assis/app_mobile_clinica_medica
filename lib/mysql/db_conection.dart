import 'package:mysql_client/mysql_client.dart';

void main() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "password",
      databaseName: "app_flutter",
    );

    await conn.connect();
    print("✅ Conectado com sucesso!");

    // Criar o schema app_flutter se não existir
    await conn.execute("CREATE SCHEMA IF NOT EXISTS app_flutter");

    // Mostrar todos os databases
    var result = await conn.execute("SHOW DATABASES");
    for (final row in result.rows) {
      print("Banco de Dados: ${row.colAt(0)}");
    }

    // Criar a tabela users se não existir
    await conn.execute("""
      CREATE TABLE IF NOT EXISTS users (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        email VARCHAR(255)
      )
    """);

    // // Deletar tabela users
    // await conn.execute("DROP TABLE IF EXISTS users");
    // print("✅ Tabela users deletada!");

    // Mostrar todas as tabelas
    result = await conn.execute("SHOW TABLES");
    for (final row in result.rows) {
      print("Tabela: ${row.colAt(0)}");
    }

    await conn.close();
  } catch (e) {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }
}
