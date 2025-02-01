part of use_case;

/// Doc Required
class SearchProjectsUseCase extends UseCase<List<ProjectEntity>, String> {
  /// Doc Required
  SearchProjectsUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(final String params) async {
    try {
      final List<ProjectEntity> projects =
          await projectRepository.searchProjects(params);

      return Right<Failure, List<ProjectEntity>>(projects);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to search projects',
        e: e,
        stack: s,
      );
      return Left<Failure, List<ProjectEntity>>(
        ServerFailure('Failed to search projects'),
      );
    }
  }
}
