import 'package:festival_buddy/service/connectivity_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final internetConnectivityCheckerProvider =
    Provider<ConnectivityService>((ref) {
  final checker = ConnectivityService();

  
  ref.onDispose(checker.dispose);

  return checker;
});

final connectionStateProvider = StreamProvider<bool>((ref) {
  final checker = ref.watch(internetConnectivityCheckerProvider);
  return checker.onStatusChange;
});