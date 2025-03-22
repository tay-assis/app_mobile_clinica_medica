import 'package:mysql1/mysql1.dart';
import 'package:flutter/foundation.dart';

class DatabaseConection {
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'password',
    db: 'teste',
  );

  Future<void> connectAndQuery() async {
    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query('SELECT * FROM produtos');
    for (var row in results) {
      if (kDebugMode) {
        print('Produto: ${row[0]}, Nome: ${row[1]}');
      }
    }
    await conn.close();
  }
}
