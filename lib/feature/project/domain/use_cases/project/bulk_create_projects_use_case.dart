import 'package:todo_app/core/app_library.dart';

class BulkCreateProjectsUseCase extends UseCase<void, List<Map<String, dynamic>>> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  BulkCreateProjectsUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(List<Map<String, dynamic>> data) async {
    try {
      await projectRepository.bulkCreateProjects(data);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to bulk create projects', e: e, stack: s);
      return Left(ServerFailure('Failed to bulk create projects'));
    }
  }
}
