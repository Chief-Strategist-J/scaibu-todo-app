part of use_case;

/// Doc Required
class GetPaginatedProjectsForTodoUseCase
    extends UseCase<ProjectEntity, Map<String, dynamic>> {
  /// Doc Required
  GetPaginatedProjectsForTodoUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, ProjectEntity>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final ProjectEntity project =
          await projectRepository.getPaginatedProjectsForTodo(params);
      return Right<Failure, ProjectEntity>(project);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to get paginated projects for todo',
        e: e,
        stack: s,
      );
      return Left<Failure, ProjectEntity>(
        ServerFailure('Failed to get paginated projects for todo'),
      );
    }
  }
}
