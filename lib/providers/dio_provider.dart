import 'package:dio/dio.dart';
import 'package:festival_buddy/remote/event_api.dart';
import 'package:festival_buddy/remote/sync_metadata_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000',
    ),
  );
});

final eventApiProvider = Provider<EventApi>((ref) {
  return EventApi(ref.watch(dioProvider));
});
final syncMetadataApiProvider = Provider<SyncMetadataApi>((ref) {
  return SyncMetadataApi(ref.watch(dioProvider));
});