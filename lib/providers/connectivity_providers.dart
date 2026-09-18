import 'package:festival_buddy/service/sync_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final internetConnectivityCheckerProvider =
    Provider<SyncService>((ref) {
  final checker = SyncService();

  
  ref.onDispose(checker.dispose);

  return checker;
});

final connectionStateProvider = StreamProvider<bool>((ref) {
  final checker = ref.watch(internetConnectivityCheckerProvider);
  return checker.onStatusChange;
});