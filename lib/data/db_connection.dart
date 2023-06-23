import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_source.dart';

class DbConnection {
  static Database? _database;

  static Future<Database> getConexaoDB() async {
    if (_database == null) {
      String databasesPath = await getDatabasesPath();
      String dbPath = join(databasesPath, DATABASE_NAME);
      _database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(CREATE_USER_TABLE_SCRIPT);

          await db.rawInsert(
              '''insert into $USER_TABLE_NAME ($USER_COLUMN_EMAIL, $USER_COLUMN_SENHA, $USER_COLUMN_NOME_COMPLETO) 
              values('exemplo@exemplo.com','123','Admin do Sistema');''');

          await db.execute(CREATE_CAR_TABLE_SCRIPT);

          await db.rawInsert(
              '''insert into $CAR_TABLE_NAME ($CAR_COLUMN_MARCA, $CAR_COLUMN_MODELO, $CAR_COLUMN_PLACA, $CAR_COLUMN_ID_USER) 
              values('FORD','RAPTOR','SATAN-6666','1');''');

          await db.execute(CREATE_FUEL_TABLE_SCRIPT);
        },
      );
    }
    return _database!;
  }
}
