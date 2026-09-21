import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = 'Festival_buddy.db';
  static const int _databaseVersion = 1;

  Future<Database> get database async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events (
        event_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE map (
        map_id INTEGER PRIMARY KEY AUTOINCREMENT,
        map BLOB NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE update (
        update_id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Reportform (
        report_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        message TEXT NOT NULL
      )
    ''');
  }
}