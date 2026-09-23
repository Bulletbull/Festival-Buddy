import 'dart:async';

import 'package:festival_buddy/local_repository/program_local_repository.dart';
import 'package:festival_buddy/remote_repository/program_remote_repository.dart';
import 'package:festival_buddy/service/connectivity_service.dart';

class SyncService {
  final ProgramLocalRepository programLocalRepository;
  final ProgramRemoteRepository programRemoteRepository;
  final ConnectivityService connectivityService;

  StreamSubscription<bool>? _connectivitySubscription;

  SyncService(this.programLocalRepository,
              this.programRemoteRepository,
              this.connectivityService);

  void start() {
    _connectivitySubscription =
        connectivityService.onStatusChange.listen((online) {
      if (online) {
        sync();
      }
    });
  }

  void sync(){

  }
  Future<void> dispose() async {
    await _connectivitySubscription?.cancel();
  }
}