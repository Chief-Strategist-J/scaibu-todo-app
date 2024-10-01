import 'package:todo_app/core/app_library.dart';

class AssignTodosToProjectUseCase extends UseCase<void, Map<String, dynamic>> {
  final ProjectRepository<ProjectEntity> projectRepository;

  AssignTodosToProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      await projectRepository.assignTodosToProjectsRequest(params);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to assign todos to project', e: e, stack: s);
      return Left(ServerFailure('Failed to assign todos to project'));
    }
  }
}
