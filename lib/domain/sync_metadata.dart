

class SyncMetadata{
  final String key;
  final int version;

  SyncMetadata({
    required this.key,
    required this.version
  });

  factory SyncMetadata.fromMap(Map<String, dynamic> map) {
    return SyncMetadata(
      key: map['key'] as String,
      version: map['version'] as int
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'version': version
    };
  }
}