part of use_case;

/// Doc Required
class UpdateProjectUseCase extends UseCase<void, Map<String, dynamic>> {
  /// Doc Required
  UpdateProjectUseCase({required this.projectRepository});

  /// Doc Required
  final ProjectRepository<ProjectEntity> projectRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic> params) async {
    try {
      final String id = params['id'] as String;
      final Map<String, dynamic> data = params['data'] as Map<String, dynamic>;

      await projectRepository.updateProject(id, data);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to update project',
        e: e,
        stack: s,
      );

      return Left<Failure, void>(ServerFailure('Failed to update project'));
    }
  }
}
