import 'package:easy_travel/core/database/app_database.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao {
  Future<void> insert(Destination destination) async {
    Database db = await AppDatabase().database;
    await db.insert('destinations', destination.toMap());
  }

  Future<void> delete(int id) async {
    Database db = await AppDatabase().database;
    db.delete('destinations', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Destination>> fetchAll() async {
    Database db = await AppDatabase().database;
    List maps = await db.query('destinations');
    return maps.map((map) => Destination.fromMap(map)).toList();
  }

  Future<Set<int>> fetchAllIds() async {
    Database db = await AppDatabase().database;
    List maps =
        await db.query('destinations', columns: ['id']);
    return maps.map((map) => map['id'] as int).toSet();
  }

  Future<bool> isFavorite(int id) async {
    Database db = await AppDatabase().database;
    List maps = await db.query(
      'destinations',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
