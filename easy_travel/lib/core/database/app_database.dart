import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'easty_travel.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''create table destinations (
     id integer primary key,
     title text,
     poster_path text,
     overview text
     )''');
      },
      version: 1,
    );
  }
}
