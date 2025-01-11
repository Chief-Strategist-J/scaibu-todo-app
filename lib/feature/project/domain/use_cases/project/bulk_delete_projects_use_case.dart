import 'package:todo_app/core/app_library.dart';

class BulkDeleteProjectsUseCase extends UseCase<void, List<String>> {
  BulkDeleteProjectsUseCase({required this.projectRepository});
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final List<String> params) async {
    try {
      await projectRepository.bulkDeleteProjects(params);
      return const Right(null);
    } catch (e, s) {
      await logService.crashLog(
          errorMessage: 'Failed to bulk delete projects', e: e, stack: s);
      return Left(ServerFailure('Failed to bulk delete projects'));
    }
  }
}
