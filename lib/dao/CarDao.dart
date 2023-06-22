import 'package:sqflite/sqflite.dart';

import '../data/db_connection.dart';
import '../entity/CarEntity.dart';

class CarEntityDao {
  final String tableName = 'car';

  Future<int> insertCar(CarEntity car) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.insert(tableName, car.toMap());
  }

  Future<List<CarEntity>> getAllCars() async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return CarEntity.fromMap(maps[index]);
    });
  }

  Future<int> updateCar(CarEntity car) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.update(
      tableName,
      car.toMap(),
      where: 'id = ?',
      whereArgs: [car.id],
    );
  }

  Future<int> deleteCar(int id) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
