
import 'package:festival_buddy/domain/event.dart';

import '../local_repository/program_local_repository.dart';

class ProgramService {
  final ProgramLocalRepository programLocalRepository;

  ProgramService(this.programLocalRepository);

    Future<List<Event>> getEvents() async {
    return await programLocalRepository.getEvents();
  }
}