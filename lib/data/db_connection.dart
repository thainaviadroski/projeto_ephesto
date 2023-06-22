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
          await db.execute(CREATE_CAR_TABLE_SCRIPT);
          await db.execute(CREATE_FUEL_TABLE_SCRIPT);
        },
      );
    }
    return _database!;
  }
}
