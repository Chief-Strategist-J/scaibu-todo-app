import 'package:todo_app/core/app_library.dart';

class UpdateProjectUseCase extends UseCase<void, Map<String, dynamic>> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  UpdateProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      final String id = params['id'];
      final Map<String, dynamic> data = params['data'];
      
      await projectRepository.updateProject(id, data);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to update project', e: e, stack: s);
      return Left(ServerFailure('Failed to update project'));
    }
  }
}
