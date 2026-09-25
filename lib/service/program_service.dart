
import '../local_repository/program_local_repository.dart';

class ProgramService {
  final ProgramLocalRepository programLocalRepository;

  ProgramService(this.programLocalRepository);

    Future<List<Map<String, dynamic>>> getEvents() async {
    return await programLocalRepository.getEvents();
  }
}