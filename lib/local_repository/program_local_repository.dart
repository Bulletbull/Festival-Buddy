import 'package:festival_buddy/Database/database_helper.dart';
import 'package:festival_buddy/domain/event.dart';
import 'package:sqflite/sqflite.dart';

class ProgramLocalRepository {
  final DatabaseHelper databaseHelper;

  ProgramLocalRepository(this.databaseHelper);

  Future<List<Event>> getEvents() async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> rows = await db.query('events');

    return rows.map(Event.fromMap).toList();
  }
}