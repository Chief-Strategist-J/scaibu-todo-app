part of use_case;

/// Doc Required
class GetPaginatedTodosForProjectUseCase
    extends UseCase<ProjectEntity, Map<String, dynamic>> {
  /// Doc Required
  GetPaginatedTodosForProjectUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, ProjectEntity>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final ProjectEntity todos =
          await projectRepository.getPaginatedTodosForProject(params);

      return Right<Failure, ProjectEntity>(todos);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to get paginated todos for project',
        e: e,
        stack: s,
      );
      return Left<Failure, ProjectEntity>(
        ServerFailure('Failed to get paginated todos for project'),
      );
    }
  }
}
