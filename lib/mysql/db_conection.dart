import 'package:mysql_client/mysql_client.dart';

void main() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "password",
      databaseName: "teste",
    );

    await conn.connect();
    print("✅ Conectado com sucesso!");

    var result = await conn.execute("SHOW TABLES");
    for (final row in result.rows) {
      print("Tabela: ${row.colAt(0)}");
    }

    await conn.close();
    print("🔒 Conexão encerrada.");
  } catch (e) {
    print("❌ Erro ao conectar ou executar consulta: $e");
  }
}
