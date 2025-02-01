part of use_case;

/// Doc Required
class RestoreProjectUseCase extends UseCase<void, String> {
  /// Doc Required
  RestoreProjectUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await projectRepository.restoreProject(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to restore project',
        e: e,
        stack: s,
      );

      return Left<Failure, void>(ServerFailure('Failed to restore project'));
    }
  }
}
