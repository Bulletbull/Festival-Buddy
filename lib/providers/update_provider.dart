import 'package:festival_buddy/providers/program/program_local_repo_provider.dart';
import 'package:festival_buddy/service/update_service.dart';
import 'package:festival_buddy/domain/update.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateServiceProvider = Provider<UpdateService>((ref) {
  return UpdateService(ref.watch(programLocalRepositoryProvider));
});

final updatesProvider = FutureProvider<List<Update>>((ref) async {
  final updates = await ref.watch(updateServiceProvider).getUpdates();

  return updates.map((update) => Update.fromMap(update)).toList();
});