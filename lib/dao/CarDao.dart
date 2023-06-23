import 'package:project_ephesto/entity/UserEntity.dart';
import 'package:sqflite/sqflite.dart';

import '../data/db_connection.dart';
import '../entity/CarEntity.dart';

class CarEntityDao {
  final String tableName = 'car';

  get idUser => null;

  Future<int> insertCar(CarEntity car) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.insert(tableName, car.toMap());
  }

  Future<List<CarEntity>> getAllCars() async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    // ignore: avoid_print
    print("total:");
    print(maps.length);
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

  Future<List<CarEntity>> getCarsByUserId(int idUser) async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: 'idUser = ?', whereArgs: [idUser]);

    // ignore: avoid_print, prefer_interpolation_to_compose_strings
    print("TOTAL");
    // ignore: avoid_print, prefer_interpolation_to_compose_strings
    print(maps.length);

    return List.generate(maps.length, (index) {
      return CarEntity.fromMap(maps[index]);
    });
  }
}
