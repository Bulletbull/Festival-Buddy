import 'package:festival_buddy/Database/database_helper.dart';

class ProgramLocalRepository {
  final DatabaseHelper databaseHelper;

  ProgramLocalRepository(this.databaseHelper);

    Future<List<Map<String, dynamic>>> getEvents() async {
    final db = await databaseHelper.database;

    return await db.query('events');
  }

   Future<List<Map<String, dynamic>>> getUpdates() async {
    final db = await databaseHelper.database;

    return await db.query('updates');
  }

  
}