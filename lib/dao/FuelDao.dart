import 'package:sqflite/sqflite.dart';

import '../data/db_connection.dart';
import '../entity/FuelEntity.dart';

class FuelEntityDao {
  final String tableName = 'fuel';

  Future<int> insertFuel(FuelEntity fuel) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.insert(tableName, fuel.toMap());
  }

  Future<List<FuelEntity>> getAllFuels() async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return FuelEntity.fromMap(maps[index]);
    });
  }

  Future<int> updateFuel(FuelEntity fuel) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.update(
      tableName,
      fuel.toMap(),
      where: 'id = ?',
      whereArgs: [fuel.id],
    );
  }

  Future<int> deleteFuel(int id) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
