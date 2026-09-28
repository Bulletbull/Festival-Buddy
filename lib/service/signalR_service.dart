import 'package:festival_buddy/service/sync_service.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SyncSignalRService {
  final SyncService syncService;

  late final HubConnection _connection;

  SyncSignalRService(this.syncService);

  Future<void> start() async {
    _connection = HubConnectionBuilder()
        .withUrl('http://10.0.2.2:5000/syncHub')
        .build();

    _connection.on('VersionUpdated', _onVersionUpdated);

    await _connection.start();
  }

  Future<void> _onVersionUpdated(List<Object?>? arguments) async {
    if (arguments == null || arguments.isEmpty) {
      return;
    }

    final data = arguments[0] as Map;

    final key = data['key'] as String;
    final version = (data['version'] as num).toInt();

    await syncService.sync(key, version);
  }

  Future<void> stop() async {
    await _connection.stop();
  }
  }
