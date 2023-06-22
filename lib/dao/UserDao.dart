import 'package:sqflite/sqflite.dart';

import '../data/db_connection.dart';
import '../entity/UserEntity.dart';

class UserEntityDao {
  final String tableName = 'user';

  Future<int> insertUser(UserEntity user) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.insert(tableName, user.toMap());
  }

  Future<List<UserEntity>> getAllUsers() async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return UserEntity.fromMap(maps[index]);
    });
  }

  Future<UserEntity?> login(String email, String pass) async {
    final Database db = await DbConnection.getConexaoDB();
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'email = ? AND senha = ?',
      whereArgs: [email, pass],
    );

    if (maps.isEmpty) {
      return null;
    }

    return UserEntity.fromMap(maps[0]);
  }

  Future<int> updateUser(UserEntity user) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.update(
      tableName,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final Database db = await DbConnection.getConexaoDB();
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
