import 'package:festival_buddy/domain/event.dart';
import 'package:festival_buddy/providers/program/program_local_repo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final programsProvider = FutureProvider<List<Event>>((ref) {
  final repository = ref.watch(programLocalRepositoryProvider);
  return repository.getEvents();
});