import 'package:festival_buddy/Database/database_helper.dart';

class ProgramLocalRepository {
  final DatabaseHelper databaseHelper;

  ProgramLocalRepository(this.databaseHelper);

  Future<List<Event>> getEvents() async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> rows = await db.query('events');

    return rows.map(Event.fromMap).toList();
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