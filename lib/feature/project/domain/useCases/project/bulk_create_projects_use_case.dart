part of use_case;

/// Doc Required
class BulkCreateProjectsUseCase
    extends UseCase<void, List<Map<String, dynamic>>> {
  /// Doc Required
  BulkCreateProjectsUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(
    final List<Map<String, dynamic>> params,
  ) async {
    try {
      await projectRepository.bulkCreateProjects(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to bulk create projects',
        e: e,
        stack: s,
      );
      return Left<Failure, void>(
        ServerFailure('Failed to bulk create projects'),
      );
    }
  }
}
