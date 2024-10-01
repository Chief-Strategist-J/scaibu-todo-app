import 'package:todo_app/core/app_library.dart';

class CreateProjectUseCase extends UseCase<void, Map<String, dynamic>> {
  final ProjectRepository<ProjectEntity> projectRepository;

  CreateProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      await projectRepository.createProject(params);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create project', e: e, stack: s);
      return Left(ServerFailure('Failed to create project'));
    }
  }
}
