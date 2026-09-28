import 'package:dio/dio.dart';
import 'package:festival_buddy/domain/sync_metadata.dart';

class SyncMetadataApi {
  final Dio dio;

  SyncMetadataApi(this.dio);

  Future<List<SyncMetadata>> getVersions() async {

    final response = await dio.get('/metadata');

    return (response.data as List)
        .map((json) => SyncMetadata.fromMap(json))
        .toList();
  }
  }
