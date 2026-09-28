import 'dart:async';

import 'package:dio/dio.dart';
import 'package:festival_buddy/domain/event.dart';
import 'package:festival_buddy/local_repository/program_local_repository.dart';
import 'package:festival_buddy/local_repository/sync_metadata_repository.dart';
import 'package:festival_buddy/providers/event_provider.dart';
import 'package:festival_buddy/remote/event_api.dart';
import 'package:festival_buddy/remote/sync_metadata_api.dart';
import 'package:festival_buddy/service/connectivity_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SyncService {
  final ProgramLocalRepository programLocalRepository;
  final SyncMetadataRepository syncMetadataRepository;
  final EventApi eventApi;
  final SyncMetadataApi syncMetadataApi;
  final ConnectivityService connectivityService;
  final Ref ref;

  StreamSubscription<bool>? _connectivitySubscription;

  SyncService(this.programLocalRepository,
              this.eventApi,
              this.connectivityService, 
              this.syncMetadataRepository, 
              this.syncMetadataApi,
              this.ref);

  void start() {
    _connectivitySubscription =
        connectivityService.onStatusChange.listen((online) {
      if (online) {
        checkForUpdates();
      }
    });
  }

  Future<void> checkForUpdates() async {
    try{
      final serverVersions = await syncMetadataApi.getVersions();

    for (final serverVersion in serverVersions) {
      final int? localVersion =
          await syncMetadataRepository.getVersion(serverVersion.key);
      if(localVersion != null){
        if (serverVersion.version > localVersion) {
          await sync(serverVersion.key, serverVersion.version);
        }
      }         
    }
    }on DioException catch (e) {
    debugPrint('Failed to check for updates: $e');
  }
    
  }

  Future<void> sync(String key, int version) async{
      switch(key){
        case 'program':
          List<Event> events = await eventApi.getEvents();
          await programLocalRepository.updateEvents(version, events);
          ref.invalidate(eventsProvider);
        break;
        case 'map' :

        break;
      }
  }
  Future<void> dispose() async {
    await _connectivitySubscription?.cancel();
  }
}