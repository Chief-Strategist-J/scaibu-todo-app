part of use_case;

/// Doc Required
class DeleteProjectUseCase extends UseCase<void, int> {
  /// Doc Required
  DeleteProjectUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final int params) async {
    try {
      await projectRepository.deleteProject(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to delete project',
        e: e,
        stack: s,
      );
      return Left<Failure, void>(ServerFailure('Failed to delete project'));
    }
  }
}
