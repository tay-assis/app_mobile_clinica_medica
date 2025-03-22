import 'package:mysql_client/mysql_client.dart';

void main() async {
  final conn = await MySQLConnection.createConnection(
    host: "localhost",
    port: 3306,
    userName: "root",
    password: "password",
    databaseName: "meubanco",
  );

  await conn.connect();
  print("✅ Conectado com sucesso!");

  var result = await conn.execute("SHOW TABLES");
  for (final row in result.rows) {
    print(row.colAt(0));
  }

  await conn.close();
}
