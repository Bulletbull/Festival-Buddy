

import 'package:festival_buddy/Database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class SyncMetadataRepository {
  final DatabaseHelper databaseHelper;
  SyncMetadataRepository(this.databaseHelper);

  Future updateMetadata(String key, int newVersion) async{
    Database db = await databaseHelper.database;
    await db.update(
      'sync_metadata',
      {'version': newVersion},
      where: 'key = ?',
      whereArgs: [key],
    );
  }
  Future<int?> getVersion(String key) async{
    Database db = await databaseHelper.database;
        final rows = await db.query(
        'sync_metadata',
        columns: ['version'],
        where: 'key = ?',
        whereArgs: [key],
      );
      if(rows.isEmpty){
        return null;
      }
      return rows.first['version'] as int;
  }
}