import 'package:app_mobile_clinica_medica/mysql/models/address.dart';
import 'package:app_mobile_clinica_medica/mysql/models/clinic.dart';
import 'package:app_mobile_clinica_medica/mysql/models/doctor.dart';
import 'package:app_mobile_clinica_medica/mysql/models/doctorInsurance.dart';
import 'package:app_mobile_clinica_medica/mysql/models/doctorSchedule.dart';
import 'package:app_mobile_clinica_medica/mysql/models/insurance.dart';
import 'package:app_mobile_clinica_medica/mysql/models/pacient.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:drift/drift.dart';


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

    // Configuração do banco de dados
    @DriftDatabase(
      tables: [Addresses, Clinics, Doctors, Insurances, Patients, DoctorInsurances, Doctorschedule],
    ) 

    class AppDatabase extends _$AppDatabase {
      AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

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
