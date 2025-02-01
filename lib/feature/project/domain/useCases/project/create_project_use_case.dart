part of use_case;

/// Doc Required
class CreateProjectUseCase extends UseCase<void, Map<String, dynamic>> {
  /// Doc Required
  CreateProjectUseCase({required this.projectRepository});
  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic> params) async {
    try {
      await projectRepository.createProject(params);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
          errorMessage: 'Failed to create project', e: e, stack: s);
      return Left<Failure, void>(ServerFailure('Failed to create project'));
    }
  }
}
