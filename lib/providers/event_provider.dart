import 'package:festival_buddy/domain/event.dart';
import 'package:festival_buddy/providers/program/program_local_repo_provider.dart';
import 'package:festival_buddy/service/program_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final programServiceProvider = Provider<ProgramService>((ref) {
	return ProgramService(ref.watch(programLocalRepositoryProvider));
});

final eventsProvider = FutureProvider<List<Event>>((ref) {
	return ref.watch(programServiceProvider).getEvents();
});
