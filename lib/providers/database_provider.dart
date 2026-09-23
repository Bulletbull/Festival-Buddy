import 'package:festival_buddy/Database/database_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final databaseProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});