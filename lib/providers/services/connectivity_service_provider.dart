import 'package:festival_buddy/service/connectivity_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) {
  final service = ConnectivityService();

  ref.onDispose(() {
    service.dispose();
  });

  return service;
});