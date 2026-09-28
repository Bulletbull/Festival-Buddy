import 'package:festival_buddy/providers/dio_provider.dart';
import 'package:festival_buddy/providers/program/program_local_repo_provider.dart';
import 'package:festival_buddy/providers/services/connectivity_service_provider.dart';
import 'package:festival_buddy/providers/sync_metadata_repo_provider.dart';
import 'package:festival_buddy/service/sync_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    ref.watch(programLocalRepositoryProvider),
    ref.watch(eventApiProvider),
    ref.watch(connectivityServiceProvider),
    ref.watch(syncMetadataRepositoryProvider),
    ref.watch(syncMetadataApiProvider),
  );
});