
import '../local_repository/program_local_repository.dart';

class UpdateService {
  final ProgramLocalRepository programLocalRepository;

  UpdateService(this.programLocalRepository);

    Future<List<Map<String, dynamic>>> getUpdates() async {
    return await programLocalRepository.getUpdates();
  }
}