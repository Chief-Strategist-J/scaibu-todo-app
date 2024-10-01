import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';

class GetProjectCategoryDataUseCase extends UseCase<ProjectCategoryDataModelEntity, NoParams> {
  final ProjectRepository<ProjectEntity> projectRepository;

  GetProjectCategoryDataUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, ProjectCategoryDataModelEntity>> call(NoParams params) async {
    try {
      final projectCategoryData = await projectRepository.getProjectCategoryData();

      return Right(projectCategoryData);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to fetch project category data', e: e, stack: s);
      return Left(ServerFailure('Failed to fetch project category data'));
    }
  }
}
