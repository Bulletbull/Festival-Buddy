import 'package:festival_buddy/providers/services/sync_service_provider.dart';
import 'package:festival_buddy/service/signalR_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final syncSignalRServiceProvider =
    Provider<SyncSignalRService>((ref) {
  return SyncSignalRService(
    ref.watch(syncServiceProvider),
  );
});