part of use_case;

/// Doc Required
class ArchiveProjectUseCase extends UseCase<void, String> {
  /// Doc Required
  ArchiveProjectUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await projectRepository.archiveProject(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
          errorMessage: 'Failed to archive project', e: e, stack: s);
      return Left<Failure, void>(ServerFailure('Failed to archive project'));
    }
  }
}
