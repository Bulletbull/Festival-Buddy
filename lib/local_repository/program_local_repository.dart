import 'package:festival_buddy/Database/database_helper.dart';
import 'package:festival_buddy/domain/event.dart';
import 'package:sqflite/sqflite.dart';

class ProgramLocalRepository {
  final DatabaseHelper databaseHelper;

  ProgramLocalRepository(this.databaseHelper);

    Future<List<Map<String, dynamic>>> getEvents() async {
    final db = await databaseHelper.database;

    return await db.query('events');
  }
  Future updateEvents(int newVersion, List<Event> events) async {
      Database db = await databaseHelper.database;
      await db.transaction((txn) async {

      await txn.delete('events');


      for (final event in events) {
        await txn.insert('events', event.toMap());
      }


      await txn.update(
        'sync_metadata',
        {'version': newVersion},
        where: 'key = ?',
        whereArgs: ['program'],
      );
    });
  }
}