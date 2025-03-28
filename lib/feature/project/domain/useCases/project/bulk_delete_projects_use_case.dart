part of use_case;

/// Doc Required
class BulkDeleteProjectsUseCase extends UseCase<void, List<String>> {
  /// Doc Required
  BulkDeleteProjectsUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final List<String> params) async {
    try {
      await projectRepository.bulkDeleteProjects(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to bulk delete projects',
        e: e,
        stack: s,
      );
      return Left<Failure, void>(
        ServerFailure('Failed to bulk delete projects'),
      );
    }
  }
}
