
import 'package:festival_buddy/providers/database_provider.dart';
import 'package:festival_buddy/local_repository/program_local_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final programLocalRepositoryProvider = Provider<ProgramLocalRepository>((ref) {
  return ProgramLocalRepository(
    ref.watch(databaseProvider));
});