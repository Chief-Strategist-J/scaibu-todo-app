part of use_case;

/// Doc Required
class GetProjectByIdUseCase extends UseCase<ProjectEntity?, String> {
  /// Doc Required
  GetProjectByIdUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, ProjectEntity?>> call(final String params) async {
    try {
      final ProjectEntity? project =
          await projectRepository.getProjectById(params);
      return Right<Failure, ProjectEntity?>(project);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to get project by ID',
        e: e,
        stack: s,
      );

      return Left<Failure, ProjectEntity?>(
        ServerFailure('Failed to get project by ID'),
      );
    }
  }
}
