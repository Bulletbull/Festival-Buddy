import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'test_database.dart';

class DatabaseHelper {
  static const String _databaseName = 'Festival_buddy.db';
  static const int _databaseVersion = 3;

  Future<Database> get database async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      await db.execute('''
        ALTER TABLE events
        ADD COLUMN location TEXT NOT NULL DEFAULT 'Unknown location'
      ''');
    }
  }

  Future<void> _onCreate(Database db, int version) async {

    await db.execute('''
      CREATE TABLE sync_metadata (
      key TEXT PRIMARY KEY,
      version INTEGER 
      )
    ''');

    await db.execute('''
      CREATE TABLE events (
        event_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        location TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE map (
        map_id INTEGER PRIMARY KEY AUTOINCREMENT,
        map BLOB NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE updates (
        update_id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Reportform (
        report_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        message TEXT NOT NULL
      )
    ''');

    await seedDatabase(db);
  }
}