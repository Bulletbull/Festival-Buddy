
import 'package:festival_buddy/local_repository/sync_metadata_repository.dart';
import 'package:festival_buddy/providers/database_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final syncMetadataRepositoryProvider =
    Provider<SyncMetadataRepository>((ref) {
  return SyncMetadataRepository(
    ref.watch(databaseProvider),
  );
});